import 'package:equatable/equatable.dart';

import 'food_category.dart';
import 'food_flavor.dart';
import 'food_ingredient.dart';
import 'food_region.dart';

class FoodEntity extends Equatable {
  final String foodId;
  final String foodName;
  final String foodDesc;
  final String foodHistory;
  final List<FoodIngredient> ingredients;
  final FoodRegion foodRegion;
  final FoodCategory foodCategory;
  final String imageUrl;
  final List<FoodFlavor> flavors;
  final bool isFavorite;
  final double? rating;
  final DateTime? viewedAt;

  const FoodEntity({
    required this.foodId,
    required this.foodName,
    required this.foodDesc,
    required this.foodHistory,
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
        foodHistory,
        foodRegion,
        foodCategory,
        imageUrl,
        ingredients,
        flavors,
        rating,
        isFavorite,
        viewedAt,
      ];

  // Copy
  FoodEntity copyWith({
    String? foodId,
    String? foodName,
    String? foodDesc,
    String? foodHistory,
    List<FoodIngredient>? ingredients,
    FoodRegion? foodRegion,
    FoodCategory? foodCategory,
    String? imageUrl,
    List<FoodFlavor>? flavors,
    bool? isFavorite,
    double? rating,
    DateTime? viewedAt,
  }) {
    return FoodEntity(
      foodId: foodId ?? this.foodId,
      foodName: foodName ?? this.foodName,
      foodDesc: foodDesc ?? this.foodDesc,
      foodHistory: foodHistory ?? this.foodHistory,
      ingredients: ingredients ?? this.ingredients,
      foodRegion: foodRegion ?? this.foodRegion,
      foodCategory: foodCategory ?? this.foodCategory,
      imageUrl: imageUrl ?? this.imageUrl,
      flavors: flavors ?? this.flavors,
      isFavorite: isFavorite ?? this.isFavorite,
      rating: rating ?? this.rating,
      viewedAt: viewedAt ?? this.viewedAt,
    );
  }

  // Field name
  static const String foodIdField = 'foodId';
  static const String foodNameField = 'foodName';
  static const String foodDescField = 'foodDesc';
  static const String foodHistoryField = 'foodHistory';
  static const String foodRegionField = 'foodRegion';
  static const String foodCategoryField = 'foodCategory';
  static const String imageUrlField = 'imageUrl';
  static const String ingredientsField = 'ingredients';
  static const String flavorsField = 'flavors';
  static const String ratingField = 'rating';
  static const String isFavoriteField = 'isFavorite';
  static const String viewedAtField = 'viewedAt';
}
