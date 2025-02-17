import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../generated/l10n.dart';

class AppLocalization {
  static const List<LocalizationsDelegate<Object>> delegates = [
    S.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static const List<Locale> supportedLanguages = [
    Locale('en'),
    Locale('vi'),
  ];

  static S get current => S.current;
}
