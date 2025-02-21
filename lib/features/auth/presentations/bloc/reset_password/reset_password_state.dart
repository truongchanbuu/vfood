part of 'reset_password_cubit.dart';

sealed class ResetPasswordState extends Equatable {
  final Email email;
  final bool isValid;
  final String? errorMessage;

  const ResetPasswordState({
    required this.email,
    required this.isValid,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [email, isValid, errorMessage];
}

final class ResetPasswordInitial extends ResetPasswordState {
  const ResetPasswordInitial()
      : super(email: const Email.pure(), isValid: false);
}

final class EmailChanged extends ResetPasswordState {
  EmailChanged(ResetPasswordState current, Email email)
      : super(email: email, isValid: Formz.validate([email]));
}

final class ResetEmailSending extends ResetPasswordState {
  ResetEmailSending(ResetPasswordState current)
      : super(email: current.email, isValid: current.isValid);
}

final class ResetEmailSentFailed extends ResetPasswordState {
  ResetEmailSentFailed(ResetPasswordState current, String errorMessage)
      : super(
          email: current.email,
          isValid: false,
          errorMessage: errorMessage,
        );
}

final class ResetEmailSentSucceed extends ResetPasswordState {
  ResetEmailSentSucceed(ResetPasswordState current)
      : super(email: current.email, isValid: true, errorMessage: null);
}
