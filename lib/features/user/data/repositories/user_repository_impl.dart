import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../cores/exceptions/firebase_auth_exception.dart';
import '../../../../cores/resources/data_state.dart';
import '../../../../services/firestore_service.dart';
import '../../../auth/data/models/user.model.dart';
import '../../../auth/domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  static const int documentLimit = 20;

  const UserRepositoryImpl(this._firestoreService);
  final FirestoreService<UserModel> _firestoreService;

  @override
  Future<DataState<UserModel>> createUser(UserModel user) async {
    return await _firestoreService.createById(id: user.id, data: user.toJson());
  }

  @override
  Future<DataState<UserModel>> deleteUser(String userId) async {
    return await _firestoreService.delete(id: userId);
  }

  @override
  Future<DataState<List<UserModel>>> getAllUsers({
    int limit = documentLimit,
    bool? desc,
    String? field,
    dynamic isEqualTo,
    dynamic isGreaterThan,
    dynamic isLessThan,
    String? orderBy,
  }) async {
    return await _firestoreService.getAll(
      limit: limit,
      descending: desc,
      fieldPath: field,
      isEqualTo: isEqualTo,
      isGreaterThan: isGreaterThan,
      isLessThan: isLessThan,
      orderBy: orderBy,
    );
  }

  @override
  Future<DataState<UserModel>> getUserByEmail(String email) async {
    final dataState = await _firestoreService.getAll(
        fieldPath: UserEntity.emailFieldName, isEqualTo: email);

    if (dataState is! DataFailure && (dataState.data?.isNotEmpty ?? false)) {
      return DataSuccess(dataState.data!.first);
    }

    return DataFailure(FirebaseException(
      code: FirebaseFailure.userNotFound,
      plugin: 'user',
      message: 'Not found',
    ));
  }

  @override
  Future<DataState<UserModel>> getUserById(String userId) async {
    return await _firestoreService.getById(id: userId);
  }

  @override
  Stream<DataState<UserModel?>> streamUser(String userId) {
    return _firestoreService.watchById(id: userId);
  }

  @override
  Future<DataState<UserModel>> updateUser(UserModel user) async {
    return await _firestoreService.update(id: user.id, updated: user.toJson());
  }

  @override
  Future<DataState<UserModel>> updateUserField(
      String userId, Map<String, dynamic> fields) async {
    return await _firestoreService.update(id: userId, updated: fields);
  }
}
