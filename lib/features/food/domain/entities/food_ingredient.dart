import 'package:equatable/equatable.dart';

import 'ingredient_unit.dart';

class FoodIngredient extends Equatable {
  final String ingredientName;
  final double ingredientQuantity;
  final IngredientUnit ingredientUnit;

  const FoodIngredient({
    required this.ingredientName,
    required this.ingredientQuantity,
    required this.ingredientUnit,
  });

  @override
  List<Object?> get props => [
        ingredientName,
        ingredientQuantity,
        ingredientUnit,
      ];
}
