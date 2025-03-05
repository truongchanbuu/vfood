import 'dart:ui';

import 'package:equatable/equatable.dart';

import 'food_ingredient.dart';
import 'recipe_instruction.dart';

enum FoodDifficulty {
  easy,
  medium,
  hard;

  Color get color => switch (this) {
        FoodDifficulty.easy => const Color(0XFF006400),
        FoodDifficulty.medium => const Color(0XFFFFFF00),
        FoodDifficulty.hard => const Color(0XFFFF0000),
      };
}

class FoodRecipe extends Equatable {
  final String recipeId;
  final String recipeName;
  final List<RecipeInstruction> recipeInstruction;
  final List<FoodIngredient> foodIngredients;
  final Duration preparationTime;
  final Duration cookingTime;
  final FoodDifficulty difficulty;
  final int serving;
  final DateTime createdAt;
  final DateTime? updatedAt;

  const FoodRecipe({
    required this.recipeId,
    required this.recipeName,
    required this.recipeInstruction,
    required this.foodIngredients,
    required this.preparationTime,
    required this.cookingTime,
    required this.difficulty,
    required this.serving,
    required this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [
        recipeId,
        recipeName,
        recipeInstruction,
        foodIngredients,
        preparationTime,
        cookingTime,
        difficulty,
        serving,
        createdAt,
        updatedAt,
      ];
}
