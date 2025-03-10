part of 'signup_cubit.dart';

sealed class SignUpState extends Equatable {
  final Email email;
  final Password password;
  final ConfirmPassword confirmPassword;
  final FormzSubmissionStatus formStatus;
  final bool isValid;
  final String? errorMessage;

  const SignUpState({
    required this.email,
    required this.password,
    required this.formStatus,
    required this.isValid,
    required this.errorMessage,
    required this.confirmPassword,
  });

  @override
  List<Object?> get props => [
        email,
        password,
        confirmPassword,
        formStatus,
        isValid,
        errorMessage,
      ];
}

final class SignupInitial extends SignUpState {
  const SignupInitial({
    super.email = const Email.pure(),
    super.password = const Password.pure(),
    super.confirmPassword = const ConfirmPassword.pure(),
    super.formStatus = FormzSubmissionStatus.initial,
    super.isValid = false,
    super.errorMessage,
  });
}

final class EmailChanged extends SignUpState {
  EmailChanged(SignUpState current, Email email)
      : super(
          email: email,
          isValid: Formz.validate(
            [
              email,
              current.password,
              current.confirmPassword,
            ],
          ),
          password: current.password,
          confirmPassword: current.confirmPassword,
          errorMessage: current.errorMessage,
          formStatus: current.formStatus,
        );
}

final class PasswordChanged extends SignUpState {
  PasswordChanged(
    SignUpState current,
    Password password, {
    ConfirmPassword? confirmPassword,
  }) : super(
          password: password,
          isValid: Formz.validate(
            [
              current.email,
              password,
              confirmPassword ?? current.confirmPassword,
            ],
          ),
          email: current.email,
          confirmPassword: confirmPassword ?? current.confirmPassword,
          errorMessage: current.errorMessage,
          formStatus: current.formStatus,
        );
}

final class ConfirmPasswordChanged extends SignUpState {
  ConfirmPasswordChanged(SignUpState current, ConfirmPassword confirmPassword)
      : super(
          isValid: Formz.validate(
            [
              current.email,
              current.password,
              confirmPassword,
            ],
          ),
          password: current.password,
          email: current.email,
          confirmPassword: confirmPassword,
          errorMessage: current.errorMessage,
          formStatus: current.formStatus,
        );
}

final class SignUpInProgressing extends SignUpState {
  SignUpInProgressing(SignUpState current)
      : super(
          email: current.email,
          password: current.password,
          confirmPassword: current.confirmPassword,
          formStatus: FormzSubmissionStatus.inProgress,
          isValid: current.isValid,
          errorMessage: current.errorMessage,
        );
}

final class SignUpSucceed extends SignUpState {
  SignUpSucceed(SignUpState current)
      : super(
          email: current.email,
          password: current.password,
          confirmPassword: current.confirmPassword,
          formStatus: FormzSubmissionStatus.success,
          isValid: current.isValid,
          errorMessage: current.errorMessage,
        );
}

final class SignUpFailed extends SignUpState {
  SignUpFailed(SignUpState current, [String? errorMessage])
      : super(
          email: current.email,
          password: current.password,
          confirmPassword: current.confirmPassword,
          formStatus: FormzSubmissionStatus.failure,
          isValid: current.isValid,
          errorMessage: errorMessage,
        );
}
