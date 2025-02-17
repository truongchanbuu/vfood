import 'package:flutter/material.dart';

import '../../../../config/localization/app_localization.dart';
import '../../../../cores/constants/spacing.dart';
import '../../../../cores/constants/font_sizes.dart';
import '../../../../cores/constants/colors.dart';

class HomeAppBar extends StatefulWidget {
  final double scrollHeight;
  const HomeAppBar({super.key, required this.scrollHeight});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  static const double _appBarHeight = 200;

  /// MUST <= expandedHeight
  final double maxScroll = 100;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: _appBarHeight,
      flexibleSpace: FlexibleSpaceBar(
        background: const Image(
          image: AssetImage('shared/images/homepage_hero_image.png'),
          fit: BoxFit.cover,
        ),
        title: _AppBarTitle(titleOpacity: 1 - _calculateTitleOpacity()),
        centerTitle: true,
      ),
      centerTitle: true,
      pinned: true,
    );
  }

  double _calculateTitleOpacity() {
    return (widget.scrollHeight / maxScroll).clamp(0, 1);
  }
}

class _AppBarTitle extends StatelessWidget {
  final double titleOpacity;
  const _AppBarTitle({this.titleOpacity = 1});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalization.current;

    return Visibility(
      visible: titleOpacity >= 0.3,
      child: Opacity(
        opacity: titleOpacity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Vietnamese Food Recognition",
              style: TextStyle(
                color: AppColors.textLight,
                fontWeight: FontWeight.bold,
                fontSize: AppFontSize.appBarTitle - 5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.marginM),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.paddingS),
              child: Row(
                children: [
                  Expanded(
                    child: _AppBarActionButton(
                      onPressed: () {},
                      title: localization.upload_button,
                      iconData: Icons.upload,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.paddingS),
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
        ),
      ),
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            color: AppColors.textLight,
            size: 15,
          ),
          const SizedBox(width: 5),
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
