import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../../../cores/exceptions/firebase_auth_exception.dart';
import '../../../data/models/email.dart';
import '../../../domain/repositories/auth_repository.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final AuthRepository _authRepository;
  ResetPasswordCubit(this._authRepository)
      : super(const ResetPasswordInitial());

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(EmailChanged(state, email));
  }

  Future<void> resetPassword() async {
    emit(ResetEmailSending(state));
    try {
      await _authRepository.sendPasswordResetEmail(state.email.value);
      emit(ResetEmailSentSucceed(state));
    } on PasswordResetFailure catch (e) {
      emit(ResetEmailSentFailed(state, e.message));
    }
  }
}
