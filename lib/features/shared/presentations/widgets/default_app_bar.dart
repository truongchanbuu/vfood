import 'package:flutter/material.dart';

import '../../../../cores/constants/colors.dart';
import '../../../../cores/constants/font_sizes.dart';
import '../../../../cores/extensions/context_extension.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool centerTitle;
  final List<Widget> actions;

  const DefaultAppBar({
    super.key,
    this.title,
    this.actions = const [],
    this.centerTitle = true,
  });

  @override
  Widget build(BuildContext context) {
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
              title!,
              style: TextStyle(
                color: context.isDarkMode
                    ? AppColors.textLight
                    : AppColors.textDark,
                fontSize: AppFontSize.appBarTitle,
                fontWeight: FontWeight.bold,
              ),
            ),
      actions: actions,
      centerTitle: centerTitle,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
