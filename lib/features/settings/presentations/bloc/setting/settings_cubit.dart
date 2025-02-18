import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../cores/constants/storage_keys.dart';
import '../../../../../cores/helpers/cached_client.dart';
import '../../../../../cores/helpers/setting_helper.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final CacheClient _cacheClient;
  SettingsCubit(this._cacheClient) : super(SettingsInitial());

  Locale get currentLocale => Locale.fromSubtags(languageCode: state.language);
  bool get isDarkMode => state.isDarkMode;

  Future<void> languageChanged(String value) async {
    final langCode = SettingHelper.langFullNameToCode(value);
    await _cacheClient.setString(AppStorageKeys.appLangKey, langCode);
    emit(LanguageChanged(state, langCode));
  }

  Future<void> themeChanged(bool value) async {
    await _cacheClient.setBool(AppStorageKeys.isDarkThemeKey, value);
    emit(ThemeModeChanged(state, value));
  }
}
