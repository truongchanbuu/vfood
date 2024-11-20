import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../config/api/api_config.dart';
import '../../cores/enums/api_status.dart';
import '../../cores/resources/data_state.dart';

import '../api_service.dart';

class ApiServiceImpl<T> implements ApiService<T> {
  final Dio dio;
  ApiServiceImpl(this.dio);

  DataSuccess<T> _handleResponse({
    required Response response,
    required T Function(Map<String, dynamic> json) fromJson,
  }) {
    final statusCode = response.statusCode;
    if (statusCode == ApiStatus.success.code ||
        statusCode == ApiStatus.created.code) {
      if (T is bool) {
        return DataSuccess(true as T);
      }

      final data = response.data;
      if (data is Map<String, dynamic>) {
        return DataSuccess(fromJson(data));
      } else if (data is List) {
        return DataSuccess(fromJson({'data': response.data}));
      }

      throw DioException(
        requestOptions: response.requestOptions,
        message: response.statusMessage,
        response: response,
        error: 'Unexpected response data type',
      );
    }

    throw DioException(
      requestOptions: response.requestOptions,
      response: response,
      message: response.statusMessage,
      error: 'Request failed with status code: ${response.statusCode}',
    );
  }

  DataFailure<T> _handleError({required Object e, required String endpoint}) {
    if (e is DioException) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        return DataFailure(
          DioException(
            requestOptions: e.requestOptions,
            message: e.message,
            type: e.type,
            error: 'Connection timeout. Please check your Internet connection',
          ),
        );
      } else if (e.type == DioExceptionType.connectionError) {
        return DataFailure(
          DioException(
            requestOptions: e.requestOptions,
            error: 'No Internet Connection',
            type: e.type,
          ),
        );
      }

      return DataFailure(e);
    }

    return DataFailure(
      DioException(
        requestOptions: RequestOptions(path: endpoint),
        error: 'Unexpected error occurred: $e',
      ),
    );
  }

  Options _createOptions({
    Map<String, dynamic>? headers,
    Duration? timeout,
  }) {
    return Options(
      headers: headers,
      receiveTimeout: timeout,
      sendTimeout: timeout,
      contentType: headers?['Content-Type'],
    );
  }

  Future<DataState<T>> _request({
    required String endpoint,
    required String method,
    required T Function(Map<String, dynamic> json) fromJson,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Duration timeout = ApiConfig.connectionTimeout,
  }) async {
    try {
      final options = _createOptions(headers: headers, timeout: timeout)
        ..method = method;
      final response = await dio.request(
        endpoint,
        data: data,
        options: options,
        queryParameters: queryParameters,
      );

      return _handleResponse(response: response, fromJson: fromJson);
    } catch (e) {
      return _handleError(e: e, endpoint: endpoint);
    }
  }

  @override
  Future<DataState<T>> get(
    String endpoint, {
    required T Function(Map<String, dynamic> json) fromJson,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Duration timeout = ApiConfig.connectionTimeout,
  }) =>
      _request(
        endpoint: endpoint,
        method: HttpMethod.GET,
        fromJson: fromJson,
        queryParameters: queryParameters,
        headers: headers,
        timeout: timeout,
      );

  @override
  Future<DataState<T>> post(
    String endpoint, {
    required T Function(Map<String, dynamic> json) fromJson,
    required Map<String, dynamic> data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Duration timeout = ApiConfig.connectionTimeout,
  }) =>
      _request(
        endpoint: endpoint,
        method: HttpMethod.POST,
        fromJson: fromJson,
        data: data,
        queryParameters: queryParameters,
        headers: headers,
        timeout: timeout,
      );

  @override
  Future<DataState<T>> put(
    String endpoint, {
    required T Function(Map<String, dynamic> json) fromJson,
    required Map<String, dynamic> data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Duration timeout = ApiConfig.connectionTimeout,
  }) =>
      _request(
        endpoint: endpoint,
        method: HttpMethod.PUT,
        fromJson: fromJson,
        data: data,
        queryParameters: queryParameters,
        headers: headers,
        timeout: timeout,
      );

  @override
  Future<DataState<T>> delete(
    String endpoint, {
    required T Function(Map<String, dynamic> json) fromJson,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Duration timeout = ApiConfig.connectionTimeout,
  }) =>
      _request(
        endpoint: endpoint,
        method: HttpMethod.DELETE,
        fromJson: fromJson,
        queryParameters: queryParameters,
        headers: headers,
        timeout: timeout,
      );
}
