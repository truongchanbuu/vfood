part of 'find_restaurant_bloc.dart';

sealed class FindRestaurantState extends Equatable {
  const FindRestaurantState();

  @override
  List<Object> get props => [];
}

final class FindRestaurantInitial extends FindRestaurantState {}

final class RestaurantLoading extends FindRestaurantState {}

final class FindRestaurantFailed extends FindRestaurantState {
  final String errorMessage;
  const FindRestaurantFailed(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

final class LocationPermissionDenied extends FindRestaurantState {}

final class LocationPermissionAllowed extends FindRestaurantState {}

final class MapOpened extends FindRestaurantState {}

final class MapOpenFailed extends FindRestaurantState {
  final String errorMessage;
  const MapOpenFailed(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
