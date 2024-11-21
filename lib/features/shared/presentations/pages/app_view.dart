import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../../../../../config/routes/app_routes.dart';
import '../../../../../cores/constants/colors.dart';
import '../../../../../generated/l10n.dart';
import '../../../food/presentations/pages/homepage.dart';
import '../../../settings/presentations/pages/settings_page.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  late final PersistentTabController _controller;

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    final localization = S.current;

    final tabs = <PersistentTabConfig>[
      _buildTabConfig(
        screen: const HomePage(),
        route: AppRoute.home.path,
        icon: Icons.home,
        inactiveIcon: Icons.home_outlined,
        title: localization.homepage,
      ),
      _buildTabConfig(
        screen: const SettingsPage(),
        route: AppRoute.explore.path,
        icon: Icons.explore,
        inactiveIcon: Icons.explore_outlined,
        title: localization.explore_page,
      ),
      _buildTabConfig(
        screen: const SettingsPage(),
        route: AppRoute.settings.path,
        icon: Icons.person,
        inactiveIcon: Icons.person_outline,
        title: localization.setting_page,
      ),
    ];

    return SafeArea(
      child: PersistentTabView(
        controller: _controller,
        onTabChanged: (value) => setState(() {
          _currentIndex = value;
        }),
        tabs: tabs,
        navBarBuilder: (navBarConfig) => Style8BottomNavBar(
          navBarConfig: navBarConfig,
          navBarDecoration: const NavBarDecoration(
            border: Border(top: BorderSide(color: AppColors.defaultBorderSide)),
            boxShadow: [
              BoxShadow(
                color: AppColors.defaultElevation,
                blurRadius: 2,
                spreadRadius: 2,
              )
            ],
          ),
        ),
      ),
    );
  }

  PersistentTabConfig _buildTabConfig({
    required Widget screen,
    required String route,
    required IconData icon,
    required IconData inactiveIcon,
    required String title,
  }) {
    return PersistentTabConfig(
      screen: screen,
      navigatorConfig: NavigatorConfig(initialRoute: route),
      item: ItemConfig(
        icon: Icon(icon),
        inactiveIcon: Icon(inactiveIcon, color: AppColors.primary),
        title: title,
        activeForegroundColor: AppColors.textLight,
        activeColorSecondary: AppColors.primary,
      ),
    );
  }
}
