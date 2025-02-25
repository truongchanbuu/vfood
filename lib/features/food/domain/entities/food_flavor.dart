import 'dart:ui';

import 'package:iconify_flutter_plus/icons/emojione_monotone.dart';
import 'package:iconify_flutter_plus/icons/fa.dart';
import 'package:iconify_flutter_plus/icons/ic.dart';
import 'package:iconify_flutter_plus/icons/material_symbols.dart';
import 'package:iconify_flutter_plus/icons/tabler.dart';

import '../../../../generated/l10n.dart';

enum FoodFlavor {
  sweet,
  sour,
  savory,
  salty,
  spicy;

  Color get color => switch (this) {
        FoodFlavor.savory => const Color(0xFF8B4513),
        FoodFlavor.sweet => const Color(0xFFFFC0CB),
        FoodFlavor.sour => const Color(0xFFFFFF00),
        FoodFlavor.spicy => const Color(0xFFFF0000),
        FoodFlavor.salty => const Color(0xFF87CEEB),
      };

  String get icon => switch (this) {
        FoodFlavor.savory => Ic.outline_ramen_dining,
        FoodFlavor.sweet => MaterialSymbols.cake_outline,
        FoodFlavor.sour => Fa.lemon_o,
        FoodFlavor.spicy => EmojioneMonotone.hot_pepper,
        FoodFlavor.salty => Tabler.salt,
      };

  String get normalizedName => switch (this) {
        FoodFlavor.savory => S.current.savory_flavor,
        FoodFlavor.sweet => S.current.sweet_flavor,
        FoodFlavor.sour => S.current.sour_flavor,
        FoodFlavor.spicy => S.current.spicy_flavor,
        FoodFlavor.salty => S.current.salty_flavor,
      };
}
