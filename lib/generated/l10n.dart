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

  /// `Failure`
  String get failure_notification_title {
    return Intl.message(
      'Failure',
      name: 'failure_notification_title',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success_notification_title {
    return Intl.message(
      'Success',
      name: 'success_notification_title',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send_button {
    return Intl.message('Send', name: 'send_button', desc: '', args: []);
  }

  /// `Searching...`
  String get searching_hint_text {
    return Intl.message(
      'Searching...',
      name: 'searching_hint_text',
      desc: '',
      args: [],
    );
  }

  /// `No items found`
  String get no_item_found_title {
    return Intl.message(
      'No items found',
      name: 'no_item_found_title',
      desc: '',
      args: [],
    );
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

  /// `This user account has been disabled. Please contact support`
  String get user_disabled {
    return Intl.message(
      'This user account has been disabled. Please contact support',
      name: 'user_disabled',
      desc: '',
      args: [],
    );
  }

  /// `This email address is already registered`
  String get email_already_in_use {
    return Intl.message(
      'This email address is already registered',
      name: 'email_already_in_use',
      desc: '',
      args: [],
    );
  }

  /// `This action is not allowed`
  String get operation_not_allowed {
    return Intl.message(
      'This action is not allowed',
      name: 'operation_not_allowed',
      desc: '',
      args: [],
    );
  }

  /// `The password is too weak`
  String get weak_password {
    return Intl.message(
      'The password is too weak',
      name: 'weak_password',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email or password`
  String get user_not_found {
    return Intl.message(
      'Invalid email or password',
      name: 'user_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email or password`
  String get wrong_password {
    return Intl.message(
      'Invalid email or password',
      name: 'wrong_password',
      desc: '',
      args: [],
    );
  }

  /// `This account is linked with a different sign-in method`
  String get account_exists_with_different_credential {
    return Intl.message(
      'This account is linked with a different sign-in method',
      name: 'account_exists_with_different_credential',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email or password`
  String get invalid_credential {
    return Intl.message(
      'Invalid email or password',
      name: 'invalid_credential',
      desc: '',
      args: [],
    );
  }

  /// `The verification is failed`
  String get invalid_verification_code {
    return Intl.message(
      'The verification is failed',
      name: 'invalid_verification_code',
      desc: '',
      args: [],
    );
  }

  /// `The verification is failed`
  String get invalid_verification_id {
    return Intl.message(
      'The verification is failed',
      name: 'invalid_verification_id',
      desc: '',
      args: [],
    );
  }

  /// `Invalid phone`
  String get invalid_phone {
    return Intl.message(
      'Invalid phone',
      name: 'invalid_phone',
      desc: '',
      args: [],
    );
  }

  /// `Login Failed`
  String get login_failed {
    return Intl.message(
      'Login Failed',
      name: 'login_failed',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up Failed`
  String get sign_up_failed {
    return Intl.message(
      'Sign Up Failed',
      name: 'sign_up_failed',
      desc: '',
      args: [],
    );
  }

  /// `Reset Failed`
  String get reset_failed {
    return Intl.message(
      'Reset Failed',
      name: 'reset_failed',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get full_name_field {
    return Intl.message(
      'Full Name',
      name: 'full_name_field',
      desc: '',
      args: [],
    );
  }

  /// `Subject`
  String get subject_field {
    return Intl.message('Subject', name: 'subject_field', desc: '', args: []);
  }

  /// `Content`
  String get content_field {
    return Intl.message('Content', name: 'content_field', desc: '', args: []);
  }

  /// `Password`
  String get password_field {
    return Intl.message('Password', name: 'password_field', desc: '', args: []);
  }

  /// `Confirm Password`
  String get confirm_password_field {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password_field',
      desc: '',
      args: [],
    );
  }

  /// `Display Name`
  String get display_name_field {
    return Intl.message(
      'Display Name',
      name: 'display_name_field',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone_number_field {
    return Intl.message(
      'Phone Number',
      name: 'phone_number_field',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your full name`
  String get full_name_empty {
    return Intl.message(
      'Please enter your full name',
      name: 'full_name_empty',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get email_empty {
    return Intl.message(
      'Please enter your email',
      name: 'email_empty',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your subject`
  String get subject_empty {
    return Intl.message(
      'Please enter your subject',
      name: 'subject_empty',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your content`
  String get content_empty {
    return Intl.message(
      'Please enter your content',
      name: 'content_empty',
      desc: '',
      args: [],
    );
  }

  /// `Please choose an issue`
  String get issues_empty {
    return Intl.message(
      'Please choose an issue',
      name: 'issues_empty',
      desc: '',
      args: [],
    );
  }

  /// `The confirm password does not match`
  String get different_confirm_password {
    return Intl.message(
      'The confirm password does not match',
      name: 'different_confirm_password',
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

  /// `Sign in/Sign up`
  String get authenticate_button {
    return Intl.message(
      'Sign in/Sign up',
      name: 'authenticate_button',
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

  /// `FAQs`
  String get faqs_title {
    return Intl.message('FAQs', name: 'faqs_title', desc: '', args: []);
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

  /// `Support`
  String get support_title {
    return Intl.message('Support', name: 'support_title', desc: '', args: []);
  }

  /// `Contact us`
  String get contact_with_us_title {
    return Intl.message(
      'Contact us',
      name: 'contact_with_us_title',
      desc: '',
      args: [],
    );
  }

  /// `We will response within 24 hours`
  String get support_response_time_desc {
    return Intl.message(
      'We will response within 24 hours',
      name: 'support_response_time_desc',
      desc: '',
      args: [],
    );
  }

  /// `Issue Types`
  String get issue_type {
    return Intl.message('Issue Types', name: 'issue_type', desc: '', args: []);
  }

  /// `Attach Image (Optional)`
  String get attached_image_title {
    return Intl.message(
      'Attach Image (Optional)',
      name: 'attached_image_title',
      desc: '',
      args: [],
    );
  }

  /// `Submit support request`
  String get submit_support_request {
    return Intl.message(
      'Submit support request',
      name: 'submit_support_request',
      desc: '',
      args: [],
    );
  }

  /// `Other contacts`
  String get other_contact {
    return Intl.message(
      'Other contacts',
      name: 'other_contact',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone_contact_option {
    return Intl.message(
      'Phone',
      name: 'phone_contact_option',
      desc: '',
      args: [],
    );
  }

  /// `Technical Issues`
  String get technical_issue_option {
    return Intl.message(
      'Technical Issues',
      name: 'technical_issue_option',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect food recognition`
  String get incorrect_food_detection_option {
    return Intl.message(
      'Incorrect food recognition',
      name: 'incorrect_food_detection_option',
      desc: '',
      args: [],
    );
  }

  /// `Incomplete Food Information`
  String get incomplete_food_information_option {
    return Intl.message(
      'Incomplete Food Information',
      name: 'incomplete_food_information_option',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get payment_option {
    return Intl.message('Payment', name: 'payment_option', desc: '', args: []);
  }

  /// `Suggest new food`
  String get suggest_new_food_option {
    return Intl.message(
      'Suggest new food',
      name: 'suggest_new_food_option',
      desc: '',
      args: [],
    );
  }

  /// `Others`
  String get others_option {
    return Intl.message('Others', name: 'others_option', desc: '', args: []);
  }

  /// `Failed to make a call`
  String get phone_contact_error {
    return Intl.message(
      'Failed to make a call',
      name: 'phone_contact_error',
      desc: '',
      args: [],
    );
  }

  /// `Support Request`
  String get email_subject_contact {
    return Intl.message(
      'Support Request',
      name: 'email_subject_contact',
      desc: '',
      args: [],
    );
  }

  /// `Dear support team`
  String get email_receiver {
    return Intl.message(
      'Dear support team',
      name: 'email_receiver',
      desc: '',
      args: [],
    );
  }

  /// `I need your help for `
  String get email_body_contact {
    return Intl.message(
      'I need your help for ',
      name: 'email_body_contact',
      desc: '',
      args: [],
    );
  }

  /// `Failed to write an email`
  String get email_contact_error {
    return Intl.message(
      'Failed to write an email',
      name: 'email_contact_error',
      desc: '',
      args: [],
    );
  }

  /// `Failed to open facebook`
  String get fb_contact_error {
    return Intl.message(
      'Failed to open facebook',
      name: 'fb_contact_error',
      desc: '',
      args: [],
    );
  }

  /// `By signing in or logging in, you agree to our Terms of Service and Privacy Policy`
  String get terms_of_service_and_privacy_policy {
    return Intl.message(
      'By signing in or logging in, you agree to our Terms of Service and Privacy Policy',
      name: 'terms_of_service_and_privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get create_account_title {
    return Intl.message(
      'Create Account',
      name: 'create_account_title',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome_title {
    return Intl.message('Welcome', name: 'welcome_title', desc: '', args: []);
  }

  /// `Sign in`
  String get sign_in_button {
    return Intl.message('Sign in', name: 'sign_in_button', desc: '', args: []);
  }

  /// `Sign up`
  String get sign_up_button {
    return Intl.message('Sign up', name: 'sign_up_button', desc: '', args: []);
  }

  /// `Continue with Google`
  String get continue_with_google_button {
    return Intl.message(
      'Continue with Google',
      name: 'continue_with_google_button',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get already_have_account_title {
    return Intl.message(
      'Already have an account?',
      name: 'already_have_account_title',
      desc: '',
      args: [],
    );
  }

  /// `Don\'t have an account?`
  String get do_not_have_account_title {
    return Intl.message(
      'Don\\\'t have an account?',
      name: 'do_not_have_account_title',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password`
  String get forgot_password_title {
    return Intl.message(
      'Forgot password',
      name: 'forgot_password_title',
      desc: '',
      args: [],
    );
  }

  /// `A reset email is sent. Please check your mailbox`
  String get reset_email_sent {
    return Intl.message(
      'A reset email is sent. Please check your mailbox',
      name: 'reset_email_sent',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile_title {
    return Intl.message('Profile', name: 'profile_title', desc: '', args: []);
  }

  /// `Logout`
  String get logout_button {
    return Intl.message('Logout', name: 'logout_button', desc: '', args: []);
  }

  /// `Re-authenticate with Google`
  String get re_auth_with_google {
    return Intl.message(
      'Re-authenticate with Google',
      name: 're_auth_with_google',
      desc: '',
      args: [],
    );
  }

  /// `Re-authentication with password`
  String get re_auth_with_email {
    return Intl.message(
      'Re-authentication with password',
      name: 're_auth_with_email',
      desc: '',
      args: [],
    );
  }

  /// `An verified email has been sent`
  String get verified_email_sent {
    return Intl.message(
      'An verified email has been sent',
      name: 'verified_email_sent',
      desc: '',
      args: [],
    );
  }

  /// `Noodles`
  String get noodles {
    return Intl.message('Noodles', name: 'noodles', desc: '', args: []);
  }

  /// `Rice Dishes`
  String get rice_dishes {
    return Intl.message('Rice Dishes', name: 'rice_dishes', desc: '', args: []);
  }

  /// `Soup`
  String get soup {
    return Intl.message('Soup', name: 'soup', desc: '', args: []);
  }

  /// `Favorite Food`
  String get favorite_food_title {
    return Intl.message(
      'Favorite Food',
      name: 'favorite_food_title',
      desc: '',
      args: [],
    );
  }

  /// `Food Category`
  String get food_category_title {
    return Intl.message(
      'Food Category',
      name: 'food_category_title',
      desc: '',
      args: [],
    );
  }

  /// `Food Region`
  String get food_region_title {
    return Intl.message(
      'Food Region',
      name: 'food_region_title',
      desc: '',
      args: [],
    );
  }

  /// `Food Flavor`
  String get food_flavor_title {
    return Intl.message(
      'Food Flavor',
      name: 'food_flavor_title',
      desc: '',
      args: [],
    );
  }

  /// `Sweet`
  String get sweet_flavor {
    return Intl.message('Sweet', name: 'sweet_flavor', desc: '', args: []);
  }

  /// `Sour`
  String get sour_flavor {
    return Intl.message('Sour', name: 'sour_flavor', desc: '', args: []);
  }

  /// `Savory`
  String get savory_flavor {
    return Intl.message('Savory', name: 'savory_flavor', desc: '', args: []);
  }

  /// `Spicy`
  String get spicy_flavor {
    return Intl.message('Spicy', name: 'spicy_flavor', desc: '', args: []);
  }

  /// `Salty`
  String get salty_flavor {
    return Intl.message('Salty', name: 'salty_flavor', desc: '', args: []);
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
