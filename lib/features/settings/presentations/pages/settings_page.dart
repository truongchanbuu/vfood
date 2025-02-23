import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../cores/constants/colors.dart';
import '../../../../cores/constants/font_sizes.dart';
import '../../../../cores/constants/spacing.dart';
import '../../../../cores/extensions/context_extension.dart';
import '../../../../cores/helpers/setting_helper.dart';
import '../../../../generated/l10n.dart';
import '../../../../injection_container.dart';
import '../../../auth/presentations/bloc/auth_bloc/auth_bloc.dart';
import '../../../auth/presentations/bloc/login/login_cubit.dart';
import '../../../auth/presentations/bloc/signup/signup_cubit.dart';
import '../../../auth/presentations/pages/auth_page.dart';
import '../../../user/presentation/bloc/update_info/update_info_cubit.dart';
import '../../../user/presentation/pages/profile_page.dart';
import '../bloc/contact/contact_cubit.dart';
import '../bloc/setting/settings_cubit.dart';
import '../widgets/setting_selection_bottom_sheet.dart';
import 'contact_support_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = context.select(
      (AuthBloc auth) => auth.state.user,
    );

    final backgroundColor =
        context.isDarkMode ? AppColors.backgroundDark : AppColors.background;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.current.setting_title,
          style: TextStyle(
            color:
                context.isDarkMode ? AppColors.textLight : AppColors.textDark,
          ),
        ),
        centerTitle: false,
        backgroundColor: backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.paddingM),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionHeader(context, S.current.general_section_title),
              _buildSettingsCard(context, [
                _buildLanguageTile(context),
                const Divider(height: 1),
                _buildDarkModeTile(context),
              ]),
              _buildSectionHeader(
                context,
                S.current.account_setting_section_title,
              ),
              _buildSettingsCard(
                context,
                currentUser.isLoggedIn
                    ? [
                        _buildNavigationTile(
                          context,
                          S.current.profile_management_section_title,
                          () => _onProfile(context),
                        ),
                        const Divider(height: 1),
                        _buildNavigationTile(
                          context,
                          S.current.recent_searches_section_title,
                          () {},
                        ),
                        const Divider(height: 1),
                        _buildNavigationTile(
                          context,
                          S.current.favorite_food_section_title,
                          () {},
                        ),
                      ]
                    : [
                        _buildNavigationTile(
                          context,
                          S.current.authenticate_button,
                          () => _onAuth(context),
                        ),
                      ],
              ),
              _buildSectionHeader(
                context,
                S.current.support_and_feedback_section_title,
              ),
              _buildSettingsCard(context, [
                _buildNavigationTile(
                  context,
                  S.current.contact_support_title,
                  () => _onContactSupportDisplayed(context),
                ),
                const Divider(height: 1),
                _buildNavigationTile(
                  context,
                  S.current.faqs_title,
                  () {},
                ),
                const Divider(height: 1),
                _buildNavigationTile(
                  context,
                  S.current.about_us_title,
                  () {},
                ),
              ]),
              _buildSectionHeader(context, S.current.app_information_title),
              _buildSettingsCard(context, [
                _buildInfoTile(
                  context,
                  S.current.app_version_title,
                  'v1.0.0',
                  () {},
                ),
                const Divider(height: 1),
                _buildNavigationTile(
                  context,
                  S.current.terms_and_conditions_title,
                  () => _onTermsAndConditionDisplayed(context),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: context.isDarkMode ? Colors.white : Colors.grey,
          ),
        ),
        const SizedBox(height: AppSpacing.marginS),
      ],
    );
  }

  Widget _buildSettingsCard(BuildContext context, List<Widget> children) {
    return Column(
      children: [
        Card(child: Column(children: children)),
        const SizedBox(height: AppSpacing.marginL),
      ],
    );
  }

  Widget _buildLanguageTile(BuildContext context) {
    return ListTile(
      title: Text(
        S.current.language_option_title,
        style: TextStyle(
          color: context.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      trailing: Text(
        S.current.english_option,
        style: TextStyle(
          color: context.isDarkMode ? Colors.white : Colors.grey,
        ),
      ),
      onTap: () => _onLangChanged(context),
    );
  }

  Widget _buildDarkModeTile(BuildContext context) {
    return SwitchListTile(
      title: Text(
        S.current.dark_mode_option,
        style: TextStyle(
          color: context.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      value: context.isDarkMode,
      onChanged: context.read<SettingsCubit>().themeChanged,
    );
  }

  Widget _buildNavigationTile(
    BuildContext context,
    String title,
    VoidCallback onTap,
  ) {
    return ListTile(
      title: Text(
        title,
        style:
            TextStyle(color: context.isDarkMode ? Colors.white : Colors.black),
      ),
      trailing: Icon(
        Icons.chevron_right,
        color: context.isDarkMode ? AppColors.textLight : AppColors.textGray,
      ),
      onTap: onTap,
    );
  }

  Widget _buildInfoTile(
    BuildContext context,
    String title,
    String info,
    VoidCallback onTap,
  ) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: context.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      trailing: Text(
        info,
        style: TextStyle(
          color: context.isDarkMode ? Colors.white : Colors.grey,
        ),
      ),
      onTap: onTap,
    );
  }

  void _onLangChanged(BuildContext context) {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      builder: (context) => SettingSelectionBottomSheet<String>(
        choices: SettingHelper.supportedLanguages,
        selected: context.select((SettingsCubit settings) =>
            SettingHelper.langCodeToFullName(
                settings.currentLocale.languageCode)),
        onSelected: context.read<SettingsCubit>().languageChanged,
      ),
    );
  }

  void _onTermsAndConditionDisplayed(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.paddingS),
            child: Text(
              S.current.terms_and_conditions_title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: AppFontSize.h2,
              ),
            ),
          ),
          const Divider(height: 1),
          const SizedBox(height: AppSpacing.marginS),
          const Text('This is terms and conditions')
        ],
      ),
    );
  }

  void _onContactSupportDisplayed(BuildContext context) {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.bottomToTop,
        child: BlocProvider(
          create: (_) => getIt.get<ContactCubit>(),
          child: const ContactSupportPage(),
        ),
      ),
    );
  }

  void _onAuth(BuildContext context) {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.leftToRight,
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => getIt.get<LoginCubit>()),
            BlocProvider(create: (_) => getIt.get<SignUpCubit>()),
          ],
          child: const AuthPage(),
        ),
      ),
    );
  }

  void _onProfile(BuildContext context) {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.leftToRight,
        child: BlocProvider(
          create: (_) => getIt.get<UpdateInfoCubit>(),
          child: const ProfilePage(),
        ),
      ),
    );
  }
}
