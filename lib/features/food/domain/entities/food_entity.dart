import 'package:equatable/equatable.dart';

import 'food_category.dart';
import 'food_flavor.dart';
import 'food_region.dart';

class FoodEntity extends Equatable {
  final String foodId;
  final String foodName;
  final String foodDesc;
  final FoodRegion foodRegion;
  final FoodCategory foodCategory;
  final String imageUrl;
  final List<String> ingredients;
  final List<FoodFlavor> flavors;
  final bool isFavorite;
  final double rating;
  final DateTime? viewedAt;

  const FoodEntity({
    required this.foodId,
    required this.foodName,
    required this.foodDesc,
    required this.foodRegion,
    required this.foodCategory,
    required this.imageUrl,
    required this.ingredients,
    required this.flavors,
    this.rating = 0.0,
    this.isFavorite = false,
    this.viewedAt,
  });

  @override
  List<Object?> get props => [
        foodId,
        foodName,
        foodDesc,
        foodRegion,
        foodCategory,
        imageUrl,
        ingredients,
        flavors,
        rating,
        isFavorite,
        viewedAt,
      ];

  // Field name
  static const String foodIdField = 'foodId';
  static const String foodNameField = 'foodName';
  static const String foodDescField = 'foodDesc';
  static const String foodRegionField = 'foodRegion';
  static const String foodCategoryField = 'foodCategory';
  static const String imageUrlField = 'imageUrl';
  static const String ingredientsField = 'ingredients';
  static const String flavorsField = 'flavors';
  static const String ratingField = 'rating';
  static const String isFavoriteField = 'isFavorite';
  static const String viewedAtField = 'viewedAt';
}
