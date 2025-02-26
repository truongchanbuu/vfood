import 'package:iconify_flutter_plus/icons/carbon.dart';
import 'package:iconify_flutter_plus/icons/emojione_monotone.dart';
import 'package:iconify_flutter_plus/icons/fluent_emoji_high_contrast.dart';
import 'package:iconify_flutter_plus/icons/tabler.dart';

import '../../../../generated/l10n.dart';

enum FoodCategory {
  noodles,
  riceDishes,
  bread,
  streetFood,
  soup;

  String get normalizedName => switch (this) {
        FoodCategory.noodles => S.current.noodles,
        FoodCategory.riceDishes => S.current.rice_dishes,
        FoodCategory.soup => S.current.soup,
        FoodCategory.bread => S.current.bread,
        FoodCategory.streetFood => S.current.street_food,
      };

  String get icon => switch (this) {
        FoodCategory.noodles => Carbon.noodle_bowl,
        FoodCategory.riceDishes => EmojioneMonotone.cooked_rice,
        FoodCategory.soup => Tabler.soup,
        FoodCategory.bread => FluentEmojiHighContrast.bread,
        FoodCategory.streetFood => EmojioneMonotone.hot_dog,
      };
}
