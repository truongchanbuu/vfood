import 'package:flutter/material.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';

import '../../../../cores/constants/colors.dart';
import '../../../../cores/constants/spacing.dart';
import '../../../../cores/extensions/context_extension.dart';
import '../../domain/entities/food_flavor.dart';

class FoodFlavorChipWrap extends StatelessWidget {
  final List<FoodFlavor> flavors;
  const FoodFlavorChipWrap({super.key, required this.flavors});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: flavors.map((flavor) {
        return Chip(
          shape: StadiumBorder(
            side: BorderSide(width: 1, color: flavor.color),
          ),
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Iconify(flavor.icon, color: flavor.color),
              const SizedBox(width: AppSpacing.marginS),
              Text(
                flavor.normalizedName,
                style: TextStyle(
                  color: context.isDarkMode
                      ? AppColors.textLight
                      : AppColors.textDark,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
