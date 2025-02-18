part of 'contact_cubit.dart';

sealed class ContactState extends Equatable {
  const ContactState();

  @override
  List<Object> get props => [];
}

final class ContactInitial extends ContactState {}

final class ContactSuccess extends ContactState {}

final class ContactFailure extends ContactState {
  final String errorMessage;
  const ContactFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
