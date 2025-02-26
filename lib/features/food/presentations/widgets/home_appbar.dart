import 'package:flutter/material.dart';

import '../../../../config/localization/app_localization.dart';
import '../../../../cores/constants/spacing.dart';
import '../../../../cores/constants/font_sizes.dart';
import '../../../../cores/constants/colors.dart';

class HomeAppBar extends StatefulWidget {
  final double heightRatio;
  const HomeAppBar({super.key, required this.heightRatio});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    final appBarWidth = MediaQuery.of(context).size.width;
    final appBarHeight =
        MediaQuery.of(context).size.height * widget.heightRatio;

    return SizedBox(
      width: appBarWidth,
      height: appBarHeight,
      child: Stack(
        children: [
          Image.asset(
            'assets/shared/images/homepage_hero_image.png',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
          ),
          const Align(
            alignment: Alignment.center,
            child: _AppBarTitle(),
          ),
        ],
      ),
    );
  }
}

class _AppBarTitle extends StatelessWidget {
  const _AppBarTitle();

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalization.current;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "Vietnamese Food Recognition",
          style: TextStyle(
            color: AppColors.textLight,
            fontWeight: FontWeight.bold,
            fontSize: AppFontSize.h1,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.marginM),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.marginL),
          child: Row(
            children: [
              Expanded(
                child: _AppBarActionButton(
                  onPressed: () {},
                  title: localization.upload_button,
                  iconData: Icons.upload,
                ),
              ),
              const SizedBox(width: AppSpacing.marginL),
              Expanded(
                child: _AppBarActionButton(
                  onPressed: () {},
                  title: localization.search_button,
                  iconData: Icons.search,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _AppBarActionButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final IconData iconData;

  const _AppBarActionButton({
    required this.title,
    required this.iconData,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: AppColors.primary,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            color: AppColors.textLight,
          ),
          const SizedBox(width: AppSpacing.marginXS),
          Text(
            title,
            style: const TextStyle(
              color: AppColors.textLight,
              fontSize: AppFontSize.labelSmall,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
