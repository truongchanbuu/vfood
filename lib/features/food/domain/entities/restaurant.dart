import 'package:equatable/equatable.dart';

class Restaurant extends Equatable {
  final String restaurantId;
  final String restaurantName;
  final String restaurantAddress;
  final double latitude;
  final double longitude;

  const Restaurant({
    required this.restaurantId,
    required this.restaurantName,
    required this.restaurantAddress,
    required this.latitude,
    required this.longitude,
  });

  Restaurant copyWith({
    String? restaurantId,
    String? restaurantName,
    String? restaurantAddress,
    double? latitude,
    double? longitude,
  }) {
    return Restaurant(
      restaurantId: restaurantId ?? this.restaurantId,
      restaurantName: restaurantName ?? this.restaurantName,
      restaurantAddress: restaurantAddress ?? this.restaurantAddress,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  @override
  List<Object?> get props => [
        restaurantId,
        restaurantName,
        restaurantAddress,
        latitude,
        longitude,
      ];

  // Field Name
  static const String restaurantIdField = 'restaurantId';
  static const String restaurantNameField = 'restaurantName';
  static const String restaurantAddressField = 'restaurantAddress';
  static const String latitudeField = 'latitude';
  static const String longitudeField = 'longitude';
}
