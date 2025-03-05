import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../cores/constants/colors.dart';
import '../../../../cores/constants/font_sizes.dart';
import '../../../../cores/constants/spacing.dart';
import '../../../../cores/extensions/context_extension.dart';
import '../../../../generated/l10n.dart';

class FoodHistoryDetail extends StatelessWidget {
  final String foodHistory;
  const FoodHistoryDetail({super.key, required this.foodHistory});

  static const double _historySectionDividerIntent = 100;
  static const int maxLines = 5;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.isDarkMode ? AppColors.textDark : Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(AppSpacing.radiusS),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.marginL,
        vertical: AppSpacing.marginM,
      ),
      child: Column(
        children: [
          const Divider(
            color: AppColors.primary,
            thickness: 5,
            indent: _historySectionDividerIntent,
            endIndent: _historySectionDividerIntent,
          ),
          const SizedBox(height: AppSpacing.marginS),
          ReadMoreText(
            foodHistory,
            trimMode: TrimMode.Line,
            trimLines: maxLines,
            textAlign: TextAlign.justify,
            style: const TextStyle(
              fontSize: AppFontSize.bodyLarge,
              fontWeight: FontWeight.w500,
            ),
            trimCollapsedText: ' ${S.current.show_more_text}',
            trimExpandedText: ' ${S.current.show_less_text}',
            colorClickableText: AppColors.primary,
          ),
        ],
      ),
    );
  }
}
