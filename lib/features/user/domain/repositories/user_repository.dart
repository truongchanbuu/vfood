import '../../../../cores/resources/data_state.dart';
import '../../../auth/data/models/user.model.dart';

abstract interface class UserRepository {
  // [Create]
  Future<DataState<UserModel>> createUser(UserModel user);

  // [Read]
  Future<DataState<UserModel>> getUserById(String userId);
  Future<DataState<UserModel>> getUserByEmail(String email);
  Future<DataState<List<UserModel>>> getAllUsers();
  Stream<DataState<UserModel?>> streamUser(String userId);

  // [Update]
  Future<DataState<void>> updateUser(UserModel user);
  Future<DataState<void>> updateUserField(
      String userId, Map<String, dynamic> fields);

  // [Delete]
  Future<DataState<UserModel>> deleteUser(String userId);
}
