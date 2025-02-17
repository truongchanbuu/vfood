import 'package:vfood/cores/resources/data_state.dart';

import '../config/api/api_config.dart';

abstract interface class ApiService<T> { 
  Future<DataState<T>> get(
    String endpoint, {
    required T Function(Map<String, dynamic> json) fromJson,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Duration timeout = ApiConfig.connectionTimeout,
  });

  Future<DataState<T>> post(
    String endpoint, {
    required Map<String, dynamic> data,
    required T Function(Map<String, dynamic> json) fromJson,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Duration timeout = ApiConfig.connectionTimeout,
  });

  Future<DataState<T>> put(
    String endpoint, {
    required Map<String, dynamic> data,
    required T Function(Map<String, dynamic> json) fromJson,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Duration timeout = ApiConfig.connectionTimeout,
  });

  Future<DataState<T>> delete(
    String endpoint, {
    required T Function(Map<String, dynamic> json) fromJson,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Duration timeout = ApiConfig.connectionTimeout,
  });
}
