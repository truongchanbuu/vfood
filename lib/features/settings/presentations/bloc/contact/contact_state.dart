part of 'contact_cubit.dart';

sealed class ContactState extends Equatable {
  const ContactState();

  @override
  List<Object> get props => [];
}

final class ContactInitial extends ContactState {}

final class ContactSucceed extends ContactState {}

final class ContactFailed extends ContactState {
  final String errorMessage;
  const ContactFailed(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
