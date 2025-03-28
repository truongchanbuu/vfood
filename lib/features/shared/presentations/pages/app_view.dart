import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../../../cores/constants/colors.dart';
import '../../../../generated/l10n.dart';
import '../../../../injection_container.dart';
import '../../../food/presentations/pages/homepage.dart';
import '../../../search/presentations/bloc/food_search/food_search_cubit.dart';
import '../../../settings/presentations/pages/settings_page.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  int _currentIndexTab = 0;

  final List<Widget> tabs = [
    BlocProvider(
      create: (_) => getIt.get<FoodSearchCubit>(),
      child: const HomePage(),
    ),
    Container(),
    const SettingsPage(),
  ];
  final List<GButton> navButtons = [
    GButton(
      icon: Icons.home_outlined,
      text: S.current.homepage,
    ),
    GButton(
      icon: Icons.explore_outlined,
      text: S.current.explore_page,
    ),
    GButton(
      icon: Icons.person_outline,
      text: S.current.setting_page,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndexTab,
          children: tabs,
        ),
        bottomNavigationBar: GNav(
          tabs: navButtons,
          activeColor: AppColors.textLight,
          gap: 5,
          tabBackgroundColor: AppColors.primary,
          hoverColor: AppColors.primary,
          rippleColor: AppColors.primary,
          onTabChange: (index) => setState(() => _currentIndexTab = index),
        ),
      ),
    );
  }
}
