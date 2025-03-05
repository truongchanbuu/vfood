import 'package:equatable/equatable.dart';

import '../../../../cores/extensions/num_extension.dart';
import 'ingredient_unit.dart';

class FoodIngredient extends Equatable {
  final String ingredientName;
  final double ingredientQuantity;
  final IngredientUnit? ingredientUnit;
  final bool optional;

  const FoodIngredient({
    required this.ingredientName,
    required this.ingredientQuantity,
    this.ingredientUnit,
    this.optional = false,
  });

  String get ingredientQuantityString {
    if (ingredientQuantity == 0.5) return "1/2";
    if (ingredientQuantity == 0.25) return "1/4";
    if (ingredientQuantity == 0.75) return "3/4";
    if (ingredientQuantity == 1 &&
        (ingredientUnit != IngredientUnit.kg ||
            ingredientUnit != IngredientUnit.g ||
            ingredientUnit != IngredientUnit.l ||
            ingredientUnit != IngredientUnit.ml)) {
      return "a";
    }

    return ingredientQuantity.toStringAsFixedWithoutZero();
  }

  @override
  List<Object?> get props => [
        ingredientName,
        ingredientQuantity,
        ingredientUnit,
        optional,
      ];
}
