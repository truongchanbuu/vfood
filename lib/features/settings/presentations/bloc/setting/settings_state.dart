part of 'settings_cubit.dart';

sealed class SettingsState extends Equatable {
  final bool isDarkMode;
  final String language;

  const SettingsState({
    required this.isDarkMode,
    required this.language,
  });

  @override
  List<Object> get props => [
        isDarkMode,
        language,
      ];
}

final class SettingsInitial extends SettingsState {
  SettingsInitial()
      : super(
          isDarkMode: SettingHelper.isDarkMode,
          language: SettingHelper.langCode,
        );
}

final class LanguageChanged extends SettingsState {
  LanguageChanged(SettingsState current, String language)
      : super(
          isDarkMode: current.isDarkMode,
          language: language,
        );
}

final class ThemeModeChanged extends SettingsState {
  ThemeModeChanged(SettingsState current, bool isDarkMode)
      : super(
          isDarkMode: isDarkMode,
          language: current.language,
        );
}
