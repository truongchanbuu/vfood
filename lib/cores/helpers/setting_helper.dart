import 'package:intl/intl.dart';

import '../../generated/l10n.dart';
import '../../injection_container.dart' show getIt;
import '../constants/storage_keys.dart';
import 'cached_client.dart';

class SettingHelper {
  static final cachedClient = getIt.get<CacheClient>();

  static bool get isDarkMode =>
      cachedClient.getBool(AppStorageKeys.isDarkThemeKey) ?? false;

  static String get langCode {
    final language = cachedClient.getString(AppStorageKeys.appLangKey);
    return language ?? Intl.getCurrentLocale().split('_').first;
  }

  static Map<String, String> get _langMap => {
        'en': S.current.english_option,
        'vi': S.current.vietnamese_option,
      };

  static List<String> get supportedLanguages => S.delegate.supportedLocales
      .map((locale) => langCodeToFullName(locale.toString()))
      .toList();

  static String langCodeToFullName(String langCode) {
    return _langMap[langCode] ?? 'en';
  }

  static String langFullNameToCode(String fullName) {
    return _langMap.entries
        .firstWhere(
          (entry) => entry.value.toLowerCase() == fullName.toLowerCase(),
          orElse: () => _langMap.entries.last,
        )
        .key;
  }
}
