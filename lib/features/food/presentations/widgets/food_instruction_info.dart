import 'package:flutter/material.dart';
import 'package:moment_dart/moment_dart.dart';

import '../../../../cores/constants/colors.dart';
import '../../../../cores/constants/font_sizes.dart';
import '../../../../cores/constants/spacing.dart';
import '../../../../cores/extensions/context_extension.dart';
import '../../../../cores/extensions/string_extension.dart';
import '../../../../generated/l10n.dart';
import '../../domain/entities/food_recipe.dart';

class FoodInstructionInfo extends StatelessWidget {
  final FoodRecipe foodRecipe;
  const FoodInstructionInfo({super.key, required this.foodRecipe});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.marginM),
      decoration: BoxDecoration(
        color: context.isDarkMode ? AppColors.textDark : Colors.white,
        borderRadius:
            const BorderRadius.all(Radius.circular(AppSpacing.radiusM)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _InfoItem(
            iconData: Icons.punch_clock_outlined,
            title: S.current.preparation_time,
            value: foodRecipe.preparationTime.toDurationString(),
          ),
          _InfoItem(
            iconData: Icons.timer_outlined,
            title: S.current.cooking_time,
            value: foodRecipe.cookingTime.toDurationString(
              format: const DurationFormat(
                [DurationUnit.hour, DurationUnit.minute, DurationUnit.second],
              ),
              dropPrefixOrSuffix: true,
              form: Abbreviation.semi,
            ),
          ),
          _InfoItem(
            iconData: Icons.local_fire_department_outlined,
            title: S.current.difficulty_level,
            value: foodRecipe.difficulty.name.toUpperCaseFirstLetter,
            valueColor: foodRecipe.difficulty.color,
          ),
        ],
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final IconData iconData;
  final String value;
  final String title;
  final Color? valueColor;

  const _InfoItem({
    required this.iconData,
    required this.value,
    required this.title,
    this.valueColor,
  });

  static const _spacing = SizedBox(height: AppSpacing.marginXS);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Icon(iconData),
          _spacing,
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: AppFontSize.labelLarge,
              color: valueColor,
            ),
            textAlign: TextAlign.center,
          ),
          _spacing,
          Text(
            title,
            style: const TextStyle(
              color: AppColors.textGray,
              fontSize: AppFontSize.bodyMedium,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
