import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../../cores/exceptions/firebase_auth_exception.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/email.dart';
import '../../../data/models/password.dart';
import '../../../domain/repositories/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;
  LoginCubit(this._authRepository) : super(const LoginInitial());

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(EmailChanged(state, email));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(PasswordChanged(state, password));
  }

  Future<void> logInWithGoogle() async {
    emit(LoginInProgressing(state));
    try {
      await _authRepository.logInWithGoogle();
      emit(LoginSucceed(state));
    } on LogInWithGoogleFailure catch (e) {
      emit(LoginFailed(state, e.message));
    } catch (_) {
      emit(LoginFailed(state));
    }
  }

  Future<void> logInWithCredentials() async {
    if (!state.isValid) {
      emit(LoginFailed(state, S.current.invalid_credential));
      return;
    }
    emit(LoginInProgressing(state));
    try {
      await _authRepository.logInWithEmailAndPassword(
        email: state.email.value,
        password: state.password.value,
      );
      emit(LoginSucceed(state));
    } on LogInWithEmailAndPasswordFailure catch (e) {
      emit(LoginFailed(state, e.message));
    } catch (_) {
      emit(LoginFailed(state));
    }
  }

  Future<void> reAuthenticate() async {
    emit(LoginInProgressing(state));
    try {
      await _authRepository.reAuthWithEmail(password: state.password.value);
      emit(LoginSucceed(state));
    } on LogInWithEmailAndPasswordFailure catch (e) {
      emit(LoginFailed(state, e.message));
    } catch (_) {
      emit(LoginFailed(state));
    }
  }

  Future<void> reAuthWithGoogle() async {
    try {
      await _authRepository.reAuthWithGoogle();
      emit(LoginSucceed(state));
    } on LogInWithGoogleFailure catch (e) {
      emit(LoginFailed(state, e.message));
    }
  }
}
