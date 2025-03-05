import 'package:flutter/material.dart';

import '../../../../cores/constants/colors.dart';
import '../../../../cores/constants/font_sizes.dart';
import '../../../../cores/constants/spacing.dart';

class SearchItem extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const SearchItem({
    super.key,
    required this.title,
    this.onTap,
  });

  static const BorderRadius borderRadius =
      BorderRadius.all(Radius.circular(AppSpacing.radiusS));
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: borderRadius,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          border: Border.all(color: AppColors.primary),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.marginS),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: AppFontSize.bodySmall,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
