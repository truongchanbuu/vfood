import 'package:flutter/material.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';

import '../../../../cores/constants/colors.dart';
import '../../../../cores/constants/spacing.dart';
import '../../../../cores/extensions/context_extension.dart';
import '../../domain/entities/food_category.dart';

class FoodCategoryChipWrap extends StatelessWidget {
  final List<FoodCategory> category;
  const FoodCategoryChipWrap({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: category.map((category) {
        return Chip(
          backgroundColor: AppColors.textGray.withValues(alpha: 0.1),
          shape: const StadiumBorder(),
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Iconify(category.icon),
              const SizedBox(width: AppSpacing.marginS),
              Text(
                category.normalizedName,
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
