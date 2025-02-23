import 'package:flutter/material.dart';

import '../../../../cores/constants/colors.dart';
import '../../../../cores/extensions/context_extension.dart';

AppBar defaultAppBar({
  required BuildContext context,
  String? title,
}) {
  return AppBar(
    iconTheme: IconThemeData(
      color: context.isDarkMode ? AppColors.textLight : AppColors.textDark,
    ),
    backgroundColor:
        context.isDarkMode ? AppColors.textDark : AppColors.textLight,
    elevation: 0,
  );
}
