import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cores/constants/colors.dart';
import '../../../../cores/constants/font_sizes.dart';
import '../../../../cores/constants/spacing.dart';
import '../../../../cores/constants/text_styles.dart';
import '../../../../cores/extensions/context_extension.dart';
import '../../../../cores/helpers/setting_helper.dart';
import '../../../../generated/l10n.dart';
import '../bloc/settings_cubit.dart';
import '../widgets/setting_selection_bottom_sheet.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
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
        backgroundColor: context.isDarkMode
            ? AppColors.backgroundDark
            : AppColors.background,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.paddingM),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.current.general_section_title,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: AppFontSize.labelLarge,
                ),
              ),
              const SizedBox(height: AppSpacing.marginS),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(S.current.language_option_title),
                      trailing: Text(
                        S.current.english_option,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      onTap: () => _onLangChanged(context),
                    ),
                    const Divider(height: 1),
                    SwitchListTile(
                      title: Text(S.current.dark_mode_option),
                      value: false,
                      onChanged: context.read<SettingsCubit>().themeChanged,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.marginL),
              Text(
                S.current.account_setting_section_title,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: AppFontSize.labelLarge,
                ),
              ),
              const SizedBox(height: AppSpacing.marginS),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(S.current.profile_management_section_title),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        // Navigate to profile management
                      },
                    ),
                    const Divider(height: 1),
                    ListTile(
                      title: Text(S.current.recent_searches_section_title),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        // Navigate to recent searches
                      },
                    ),
                    const Divider(height: 1),
                    ListTile(
                      title: Text(S.current.favorite_food_section_title),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        // Navigate to favorite food
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.marginL),
              Text(
                S.current.support_and_feedback_section_title,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: AppFontSize.labelLarge,
                ),
              ),
              const SizedBox(height: AppSpacing.marginS),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(S.current.contact_support_title),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        // Navigate to contact support
                      },
                    ),
                    const Divider(height: 1),
                    ListTile(
                      title: const Text('FAQs'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        // Navigate to FAQs
                      },
                    ),
                    const Divider(height: 1),
                    ListTile(
                      title: Text(S.current.about_us_title),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        // Navigate to about us
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.marginL),
              Text(
                S.current.app_information_title,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: AppFontSize.labelLarge,
                ),
              ),
              const SizedBox(height: AppSpacing.marginS),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(S.current.app_version_title),
                      trailing: const Text(
                        'v1.0.0',
                        style: TextStyle(color: Colors.grey),
                      ),
                      onTap: () {
                        // Handle app version tap
                      },
                    ),
                    const Divider(height: 1),
                    ListTile(
                      title: Text(S.current.terms_and_conditions_title),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => _onTermsAndConditionDisplayed(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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
          Text(
            S.current.terms_and_conditions_title,
            style: AppTextStyle.h4,
          ),
          const Divider(height: 1),
          const Text('This is terms and conditions')
        ],
      ),
    );
  }
}
