part of 'find_restaurant_bloc.dart';

sealed class FindRestaurantEvent extends Equatable {
  const FindRestaurantEvent();

  @override
  List<Object> get props => [];
}

final class RequestLocation extends FindRestaurantEvent {}

final class OpenMap extends FindRestaurantEvent {
  final double longitude;
  final double latitude;

  const OpenMap({required this.longitude, required this.latitude});

  @override
  List<Object> get props => [longitude, latitude];
}
