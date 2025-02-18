import 'package:flutter/material.dart';
import 'colors.dart';
import 'font_sizes.dart';

class AppTextStyle {
  static TextStyle _baseTextStyle({
    required double fontSize,
    FontWeight fontWeight = FontWeight.normal,
    Color color = AppColors.textDartGray,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,

      // Override if necessary
      // fontFamily: GoogleFonts.nunito().fontFamily,
      // fontFamilyFallback: const ['roboto', 'sans-serif'],
    );
  }

  // Headers with predefined styles
  static TextStyle h1 = _baseTextStyle(
    fontSize: AppFontSize.h1,
    fontWeight: FontWeight.bold,
  );

  static TextStyle h2 = _baseTextStyle(
    fontSize: AppFontSize.h2,
    fontWeight: FontWeight.w600,
  );

  static TextStyle h3 = _baseTextStyle(
    fontSize: AppFontSize.h3,
    fontWeight: FontWeight.w600,
  );

  static TextStyle h4 = _baseTextStyle(
    fontSize: AppFontSize.h4,
    fontWeight: FontWeight.w600,
  );

  // Food Related
  static TextStyle foodTitle = _baseTextStyle(
    fontSize: AppFontSize.foodTitle,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  static TextStyle foodDescription = _baseTextStyle(
    fontSize: AppFontSize.bodyMedium,
    color: AppColors.textGray,
  );

  static TextStyle ingredientLabel = _baseTextStyle(
    fontSize: AppFontSize.labelLarge,
    fontWeight: FontWeight.w500,
    color: AppColors.secondary,
  );

  // Recognition Results
  static TextStyle confidenceScore = _baseTextStyle(
    fontSize: AppFontSize.confidenceScore,
    fontWeight: FontWeight.w600,
    color: AppColors.success,
  );

  // Categories
  static TextStyle categoryLabel = _baseTextStyle(
    fontSize: AppFontSize.labelMedium,
    fontWeight: FontWeight.w500,
    color: AppColors.textLight,
  );
}
