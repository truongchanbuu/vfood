import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hl_image_picker/hl_image_picker.dart';

import '../../../../../cores/exceptions/firebase_auth_exception.dart';
import '../../../../../cores/helpers/image_helper.dart';
import '../../../../auth/domain/repositories/auth_repository.dart';

part 'update_info_state.dart';

class UpdateInfoCubit extends Cubit<UpdateInfoState> {
  final AuthRepository _authRepository;
  UpdateInfoCubit(this._authRepository) : super(UpdateInfoInitial());

  Future<void> _updateInfo(Future<void> Function() updateFn) async {
    try {
      emit(InfoUpdating());
      await updateFn();
      emit(UpdateSucceed());
    } on UpdateInfoFailure catch (e) {
      emit(UpdateFailed(e.message));
    }
  }

  Future<void> updateEmail(String email) =>
      _updateInfo(() => _authRepository.updateEmail(email));

  Future<void> updateDisplayName(String name) =>
      _updateInfo(() => _authRepository.updateDisplayName(name));

  Future<void> updateGender(String gender) =>
      _updateInfo(() => _authRepository.updateGender(gender));

  Future<void> updateBirthDate(DateTime date) =>
      _updateInfo(() => _authRepository.updateBirthDate(date));

  Future<void> updatePassword(String password) =>
      _updateInfo(() => _authRepository.updatePassword(password));

  Future<void> updatePhoneNumber(String phoneNumber) =>
      _updateInfo(() => _authRepository.updatePhoneNumber(phoneNumber));

  Future<void> updatePhotoUrl(String photoUrl) =>
      _updateInfo(() => _authRepository.updatePhotoUrl(photoUrl));

  Future<void> pickImage() async {
    final List<HLPickerItem> images = await ImageHelper.pickImages();
    await updatePhotoUrl(images.first.path);
  }
}
