import '../../../../generated/l10n.dart';

enum IngredientUnit {
  g,
  kg,
  ml,
  l,
  bulb,
  pinch,
  slice,
  clove,
  stalk,
  teaspoon,
  tablespoon,
  cup;

  String get unitName => switch (this) {
        g => name,
        kg => name,
        ml => name,
        l => name,
        teaspoon => S.current.teaspoon_unit,
        tablespoon => S.current.tablespoon_unit,
        cup => S.current.cup_unit,
        bulb => S.current.bulb_unit,
        pinch => S.current.pinch_unit,
        slice => S.current.slice_unit,
        clove => S.current.clove_unit,
        stalk => S.current.stalk_unit,
      };
}
