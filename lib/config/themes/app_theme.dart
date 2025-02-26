import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../cores/constants/colors.dart';
import '../../cores/constants/spacing.dart';
import '../../cores/constants/text_styles.dart';

class AppTheme {
  static const double _buttonHeight = 50;

  // Consolidate duplicate code between light and dark themes
  static ThemeData _baseTheme({
    required Brightness brightness,
    required Color scaffoldBackgroundColor,
    required ColorScheme colorScheme,
  }) {
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      colorScheme: colorScheme,

      // Common font configuration
      fontFamily: GoogleFonts.nunito().fontFamily,
      fontFamilyFallback: const ['roboto', 'sans-serif'],

      // Reusable AppBar theme
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.primary,
        titleTextStyle: AppTextStyle.h2.copyWith(
          color: brightness == Brightness.light ? Colors.white : Colors.black,
        ),
      ),

      // Consistent Card theme
      cardTheme: CardTheme(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusM),
        ),
        clipBehavior: Clip.antiAlias,
      ),

      // Unified Button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(_buttonHeight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusS),
          ),
        ),
      ),

      // Consistent Input Decoration theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        contentPadding: const EdgeInsets.all(AppSpacing.paddingM),
        iconColor: brightness == Brightness.light
            ? AppColors.textDark
            : AppColors.textLight,
        border: _buildInputBorder(AppColors.textGray.withValues(alpha: .3)),
        enabledBorder:
            _buildInputBorder(AppColors.textGray.withValues(alpha: .3)),
        focusedBorder: _buildInputBorder(AppColors.primary, width: 2),
        fillColor: brightness == Brightness.light
            ? AppColors.surfaceLight
            : AppColors.surfaceDark,
      ),
    );
  }

  // Helper method to reduce border definition repetition
  static OutlineInputBorder _buildInputBorder(Color borderColor,
      {double width = 1.0}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSpacing.radiusM),
      borderSide: BorderSide(color: borderColor, width: width),
    );
  }

  // Light theme using base configuration
  static ThemeData lightTheme = _baseTheme(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      tertiary: AppColors.tertiary,
      surface: AppColors.surfaceLight,
      error: AppColors.error,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: AppColors.textDartGray,
    ),
  );

  // Dark theme using base configuration
  static ThemeData darkTheme = _baseTheme(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      tertiary: AppColors.tertiary,
      surface: AppColors.surfaceDark,
      error: AppColors.error,
      onPrimary: Colors.black,
      onSecondary: Colors.black,
      onSurface: AppColors.textDark,
    ),
  );
}
