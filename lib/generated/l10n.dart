// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Unknown Exception`
  String get unknown_exception {
    return Intl.message(
      'Unknown Exception',
      name: 'unknown_exception',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email address`
  String get invalid_email {
    return Intl.message(
      'Invalid email address',
      name: 'invalid_email',
      desc: '',
      args: [],
    );
  }

  /// `This user account has been disabled`
  String get user_disabled {
    return Intl.message(
      'This user account has been disabled',
      name: 'user_disabled',
      desc: '',
      args: [],
    );
  }

  /// `This email address is already in use`
  String get email_already_in_use {
    return Intl.message(
      'This email address is already in use',
      name: 'email_already_in_use',
      desc: '',
      args: [],
    );
  }

  /// `This operation is not allowed`
  String get operation_not_allowed {
    return Intl.message(
      'This operation is not allowed',
      name: 'operation_not_allowed',
      desc: '',
      args: [],
    );
  }

  /// `The password provided is too weak`
  String get weak_password {
    return Intl.message(
      'The password provided is too weak',
      name: 'weak_password',
      desc: '',
      args: [],
    );
  }

  /// `No user found with this email address`
  String get user_not_found {
    return Intl.message(
      'No user found with this email address',
      name: 'user_not_found',
      desc: '',
      args: [],
    );
  }

  /// `The password is incorrect`
  String get wrong_password {
    return Intl.message(
      'The password is incorrect',
      name: 'wrong_password',
      desc: '',
      args: [],
    );
  }

  /// `An account already exists with a different credential`
  String get account_exists_with_different_credential {
    return Intl.message(
      'An account already exists with a different credential',
      name: 'account_exists_with_different_credential',
      desc: '',
      args: [],
    );
  }

  /// `The credential is invalid`
  String get invalid_credential {
    return Intl.message(
      'The credential is invalid',
      name: 'invalid_credential',
      desc: '',
      args: [],
    );
  }

  /// `The verification code is invalid`
  String get invalid_verification_code {
    return Intl.message(
      'The verification code is invalid',
      name: 'invalid_verification_code',
      desc: '',
      args: [],
    );
  }

  /// `The verification ID is invalid`
  String get invalid_verification_id {
    return Intl.message(
      'The verification ID is invalid',
      name: 'invalid_verification_id',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get homepage {
    return Intl.message('Home', name: 'homepage', desc: '', args: []);
  }

  /// `Explore`
  String get explore_page {
    return Intl.message('Explore', name: 'explore_page', desc: '', args: []);
  }

  /// `Settings`
  String get setting_page {
    return Intl.message('Settings', name: 'setting_page', desc: '', args: []);
  }

  /// `Search`
  String get search_button {
    return Intl.message('Search', name: 'search_button', desc: '', args: []);
  }

  /// `Upload`
  String get upload_button {
    return Intl.message('Upload', name: 'upload_button', desc: '', args: []);
  }

  /// `Settings`
  String get setting_title {
    return Intl.message('Settings', name: 'setting_title', desc: '', args: []);
  }

  /// `General Settings`
  String get general_section_title {
    return Intl.message(
      'General Settings',
      name: 'general_section_title',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language_option_title {
    return Intl.message(
      'Language',
      name: 'language_option_title',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english_option {
    return Intl.message('English', name: 'english_option', desc: '', args: []);
  }

  /// `Vietnamese`
  String get vietnamese_option {
    return Intl.message(
      'Vietnamese',
      name: 'vietnamese_option',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get dark_mode_option {
    return Intl.message(
      'Dark Mode',
      name: 'dark_mode_option',
      desc: '',
      args: [],
    );
  }

  /// `Light Mode`
  String get light_mode_option {
    return Intl.message(
      'Light Mode',
      name: 'light_mode_option',
      desc: '',
      args: [],
    );
  }

  /// `Account Settings`
  String get account_setting_section_title {
    return Intl.message(
      'Account Settings',
      name: 'account_setting_section_title',
      desc: '',
      args: [],
    );
  }

  /// `Profile Management`
  String get profile_management_section_title {
    return Intl.message(
      'Profile Management',
      name: 'profile_management_section_title',
      desc: '',
      args: [],
    );
  }

  /// `Recent Searches`
  String get recent_searches_section_title {
    return Intl.message(
      'Recent Searches',
      name: 'recent_searches_section_title',
      desc: '',
      args: [],
    );
  }

  /// `Favorite Food`
  String get favorite_food_section_title {
    return Intl.message(
      'Favorite Food',
      name: 'favorite_food_section_title',
      desc: '',
      args: [],
    );
  }

  /// `Support & Feedback`
  String get support_and_feedback_section_title {
    return Intl.message(
      'Support & Feedback',
      name: 'support_and_feedback_section_title',
      desc: '',
      args: [],
    );
  }

  /// `Contact Support`
  String get contact_support_title {
    return Intl.message(
      'Contact Support',
      name: 'contact_support_title',
      desc: '',
      args: [],
    );
  }

  /// `About us`
  String get about_us_title {
    return Intl.message('About us', name: 'about_us_title', desc: '', args: []);
  }

  /// `App Information`
  String get app_information_title {
    return Intl.message(
      'App Information',
      name: 'app_information_title',
      desc: '',
      args: [],
    );
  }

  /// `App Version`
  String get app_version_title {
    return Intl.message(
      'App Version',
      name: 'app_version_title',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get terms_and_conditions_title {
    return Intl.message(
      'Terms & Conditions',
      name: 'terms_and_conditions_title',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'en')];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
