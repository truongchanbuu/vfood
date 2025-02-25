import 'package:flutter/material.dart';

import '../../../../cores/constants/colors.dart';
import '../../../../cores/constants/font_sizes.dart';
import '../../../../cores/extensions/context_extension.dart';

AppBar defaultAppBar({
  required BuildContext context,
  String? title,
  bool centerTitle = true,
}) {
  return AppBar(
    iconTheme: IconThemeData(
      color: context.isDarkMode ? AppColors.textLight : AppColors.textDark,
    ),
    backgroundColor:
        context.isDarkMode ? AppColors.backgroundDark : AppColors.background,
    elevation: 0,
    title: title == null
        ? null
        : Text(
            title,
            style: TextStyle(
              color:
                  context.isDarkMode ? AppColors.textLight : AppColors.textDark,
              fontSize: AppFontSize.appBarTitle,
              fontWeight: FontWeight.bold,
            ),
          ),
    centerTitle: centerTitle,
  );
}
