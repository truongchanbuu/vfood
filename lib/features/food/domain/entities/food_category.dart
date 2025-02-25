import 'package:iconify_flutter_plus/icons/carbon.dart';
import 'package:iconify_flutter_plus/icons/emojione_monotone.dart';
import 'package:iconify_flutter_plus/icons/tabler.dart';

import '../../../../generated/l10n.dart';

enum FoodCategory {
  noodles,
  riceDishes,
  soup;

  String get normalizedName => switch (this) {
        FoodCategory.noodles => S.current.noodles,
        FoodCategory.riceDishes => S.current.rice_dishes,
        FoodCategory.soup => S.current.soup,
      };

  String get icon => switch (this) {
        FoodCategory.noodles => Carbon.noodle_bowl,
        FoodCategory.riceDishes => EmojioneMonotone.cooked_rice,
        FoodCategory.soup => Tabler.soup,
      };
}
