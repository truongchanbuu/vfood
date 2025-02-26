import '../../../../generated/l10n.dart';

enum IngredientUnit {
  g,
  kg,
  ml,
  l,
  teaspoon,
  tablespoon,
  cup;

  String get unitName => switch (this) {
        IngredientUnit.g => name,
        IngredientUnit.kg => name,
        IngredientUnit.ml => name,
        IngredientUnit.l => name,
        IngredientUnit.teaspoon => S.current.teaspoon_unit,
        IngredientUnit.tablespoon => S.current.tablespoon_unit,
        IngredientUnit.cup => S.current.cup_unit,
      };
}
