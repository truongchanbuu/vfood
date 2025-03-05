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

  /// `View all`
  String get view_all_button {
    return Intl.message(
      'View all',
      name: 'view_all_button',
      desc: '',
      args: [],
    );
  }

  /// `Review`
  String get review_button {
    return Intl.message('Review', name: 'review_button', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel_button {
    return Intl.message('Cancel', name: 'cancel_button', desc: '', args: []);
  }

  /// `Not Now`
  String get not_now_button {
    return Intl.message('Not Now', name: 'not_now_button', desc: '', args: []);
  }

  /// `Enable`
  String get enable_button {
    return Intl.message('Enable', name: 'enable_button', desc: '', args: []);
  }

  /// `Clear`
  String get clear_button {
    return Intl.message('Clear', name: 'clear_button', desc: '', args: []);
  }

  /// `Sort By`
  String get sort_by_button {
    return Intl.message('Sort By', name: 'sort_by_button', desc: '', args: []);
  }

  /// `Open Setting`
  String get open_setting_button {
    return Intl.message(
      'Open Setting',
      name: 'open_setting_button',
      desc: '',
      args: [],
    );
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

  /// `Show more`
  String get show_more_text {
    return Intl.message(
      'Show more',
      name: 'show_more_text',
      desc: '',
      args: [],
    );
  }

  /// `Show less`
  String get show_less_text {
    return Intl.message(
      'Show less',
      name: 'show_less_text',
      desc: '',
      args: [],
    );
  }

  /// `Not Found`
  String get not_found_title {
    return Intl.message(
      'Not Found',
      name: 'not_found_title',
      desc: '',
      args: [],
    );
  }

  /// `Step`
  String get step_title {
    return Intl.message('Step', name: 'step_title', desc: '', args: []);
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

  /// `Popular Vietnamese Food`
  String get popular_vietnamese_food_title {
    return Intl.message(
      'Popular Vietnamese Food',
      name: 'popular_vietnamese_food_title',
      desc: '',
      args: [],
    );
  }

  /// `Wonderful Food Every Day`
  String get wonderful_food_every_day_title {
    return Intl.message(
      'Wonderful Food Every Day',
      name: 'wonderful_food_every_day_title',
      desc: '',
      args: [],
    );
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

  /// `Bread`
  String get bread {
    return Intl.message('Bread', name: 'bread', desc: '', args: []);
  }

  /// `Street Food`
  String get street_food {
    return Intl.message('Street Food', name: 'street_food', desc: '', args: []);
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

  /// `Bitter`
  String get bitter_flavor {
    return Intl.message('Bitter', name: 'bitter_flavor', desc: '', args: []);
  }

  /// `Ingredients`
  String get food_ingredients {
    return Intl.message(
      'Ingredients',
      name: 'food_ingredients',
      desc: '',
      args: [],
    );
  }

  /// `Flavors`
  String get food_flavors {
    return Intl.message('Flavors', name: 'food_flavors', desc: '', args: []);
  }

  /// `History`
  String get food_history {
    return Intl.message('History', name: 'food_history', desc: '', args: []);
  }

  /// `Reviews`
  String get reviews_title {
    return Intl.message('Reviews', name: 'reviews_title', desc: '', args: []);
  }

  /// `Instruction`
  String get food_instruction {
    return Intl.message(
      'Instruction',
      name: 'food_instruction',
      desc: '',
      args: [],
    );
  }

  /// `Preparation Time`
  String get preparation_time {
    return Intl.message(
      'Preparation Time',
      name: 'preparation_time',
      desc: '',
      args: [],
    );
  }

  /// `Cooking Time`
  String get cooking_time {
    return Intl.message(
      'Cooking Time',
      name: 'cooking_time',
      desc: '',
      args: [],
    );
  }

  /// `Food You May Like`
  String get recommended_food_title {
    return Intl.message(
      'Food You May Like',
      name: 'recommended_food_title',
      desc: '',
      args: [],
    );
  }

  /// `Find Nearby Restaurant`
  String get find_nearby_restaurant_button {
    return Intl.message(
      'Find Nearby Restaurant',
      name: 'find_nearby_restaurant_button',
      desc: '',
      args: [],
    );
  }

  /// `teaspoon`
  String get teaspoon_unit {
    return Intl.message('teaspoon', name: 'teaspoon_unit', desc: '', args: []);
  }

  /// `tablespoon`
  String get tablespoon_unit {
    return Intl.message(
      'tablespoon',
      name: 'tablespoon_unit',
      desc: '',
      args: [],
    );
  }

  /// `cup`
  String get cup_unit {
    return Intl.message('cup', name: 'cup_unit', desc: '', args: []);
  }

  /// `bulb`
  String get bulb_unit {
    return Intl.message('bulb', name: 'bulb_unit', desc: '', args: []);
  }

  /// `pinch`
  String get pinch_unit {
    return Intl.message('pinch', name: 'pinch_unit', desc: '', args: []);
  }

  /// `slice`
  String get slice_unit {
    return Intl.message('slice', name: 'slice_unit', desc: '', args: []);
  }

  /// `clove`
  String get clove_unit {
    return Intl.message('clove', name: 'clove_unit', desc: '', args: []);
  }

  /// `stalk`
  String get stalk_unit {
    return Intl.message('stalk', name: 'stalk_unit', desc: '', args: []);
  }

  /// `Permission Required`
  String get permission_required {
    return Intl.message(
      'Permission Required',
      name: 'permission_required',
      desc: '',
      args: [],
    );
  }

  /// `Please open setting and grant the permission manually`
  String get open_setting_required_message {
    return Intl.message(
      'Please open setting and grant the permission manually',
      name: 'open_setting_required_message',
      desc: '',
      args: [],
    );
  }

  /// `Location permission is required to find nearby restaurants`
  String get location_permission_request {
    return Intl.message(
      'Location permission is required to find nearby restaurants',
      name: 'location_permission_request',
      desc: '',
      args: [],
    );
  }

  /// `Location permission is denied`
  String get location_permission_denied {
    return Intl.message(
      'Location permission is denied',
      name: 'location_permission_denied',
      desc: '',
      args: [],
    );
  }

  /// `Restaurants Nearby`
  String get restaurants_nearby_title {
    return Intl.message(
      'Restaurants Nearby',
      name: 'restaurants_nearby_title',
      desc: '',
      args: [],
    );
  }

  /// `Failed to open map`
  String get map_opened_failed {
    return Intl.message(
      'Failed to open map',
      name: 'map_opened_failed',
      desc: '',
      args: [],
    );
  }

  /// `Phở is a traditional Vietnamese noodle soup known for its aromatic broth, tender meat, and fresh herbs. The dish features a clear, savory broth, typically made by simmering beef bones with spices such as star anise, cloves, cinnamon, and cardamom. This flavorful base is poured over flat rice noodles and thinly sliced beef, which cooks gently in the hot liquid. Common garnishes include bean sprouts, Thai basil, lime wedges, and chili slices, allowing each diner to customize their bowl to taste. Variations of phở may also feature chicken, tofu, or other proteins, reflecting its versatility and widespread appeal.`
  String get pho_desc {
    return Intl.message(
      'Phở is a traditional Vietnamese noodle soup known for its aromatic broth, tender meat, and fresh herbs. The dish features a clear, savory broth, typically made by simmering beef bones with spices such as star anise, cloves, cinnamon, and cardamom. This flavorful base is poured over flat rice noodles and thinly sliced beef, which cooks gently in the hot liquid. Common garnishes include bean sprouts, Thai basil, lime wedges, and chili slices, allowing each diner to customize their bowl to taste. Variations of phở may also feature chicken, tofu, or other proteins, reflecting its versatility and widespread appeal.',
      name: 'pho_desc',
      desc: '',
      args: [],
    );
  }

  /// `Bún bò Huế is a renowned Vietnamese spicy beef noodle soup that hails from Huế, a city in central Vietnam known for its imperial cuisine. This flavorful dish features thick, cylindrical rice vermicelli noodles immersed in a rich broth infused with lemongrass and fermented shrimp sauce, offering a harmonious blend of spicy, salty, and savory flavors.\nThe broth is traditionally prepared by simmering beef bones and shank with lemongrass, then seasoning with fermented shrimp sauce and sugar. Spicy chili oil is added later to enhance its characteristic heat. Common protein additions include thinly sliced beef shank, oxtail, and pork knuckles. The dish is typically garnished with lime wedges, cilantro, diced green onions, raw sliced onions, chili sauce, and an assortment of fresh herbs such as mint, basil, perilla, and Vietnamese coriander. Banana blossoms or thinly sliced purple cabbage are also customary accompaniments, adding a refreshing crunch to the ensemble.`
  String get bun_bo_hue_desc {
    return Intl.message(
      'Bún bò Huế is a renowned Vietnamese spicy beef noodle soup that hails from Huế, a city in central Vietnam known for its imperial cuisine. This flavorful dish features thick, cylindrical rice vermicelli noodles immersed in a rich broth infused with lemongrass and fermented shrimp sauce, offering a harmonious blend of spicy, salty, and savory flavors.\nThe broth is traditionally prepared by simmering beef bones and shank with lemongrass, then seasoning with fermented shrimp sauce and sugar. Spicy chili oil is added later to enhance its characteristic heat. Common protein additions include thinly sliced beef shank, oxtail, and pork knuckles. The dish is typically garnished with lime wedges, cilantro, diced green onions, raw sliced onions, chili sauce, and an assortment of fresh herbs such as mint, basil, perilla, and Vietnamese coriander. Banana blossoms or thinly sliced purple cabbage are also customary accompaniments, adding a refreshing crunch to the ensemble.',
      name: 'bun_bo_hue_desc',
      desc: '',
      args: [],
    );
  }

  /// `Phở, Vietnam's iconic noodle soup, emerged in the early 20th century in northern Vietnam, particularly in the Nam Định province and Hanoi. Its creation is often attributed to the fusion of local culinary practices with French and Chinese influences during the colonial era. The French colonial presence increased the demand for beef, leading to a surplus of beef bones. Resourceful Vietnamese cooks utilized these bones to craft a rich, aromatic broth, combining it with rice noodles—a staple influenced by Chinese cuisine. This harmonious blend resulted in the birth of phở. Initially, phở was a simple dish sold by street vendors, but over time, it evolved, incorporating various herbs and spices, and spread throughout Vietnam and beyond, becoming a symbol of Vietnamese culinary tradition.`
  String get pho_history {
    return Intl.message(
      'Phở, Vietnam\'s iconic noodle soup, emerged in the early 20th century in northern Vietnam, particularly in the Nam Định province and Hanoi. Its creation is often attributed to the fusion of local culinary practices with French and Chinese influences during the colonial era. The French colonial presence increased the demand for beef, leading to a surplus of beef bones. Resourceful Vietnamese cooks utilized these bones to craft a rich, aromatic broth, combining it with rice noodles—a staple influenced by Chinese cuisine. This harmonious blend resulted in the birth of phở. Initially, phở was a simple dish sold by street vendors, but over time, it evolved, incorporating various herbs and spices, and spread throughout Vietnam and beyond, becoming a symbol of Vietnamese culinary tradition.',
      name: 'pho_history',
      desc: '',
      args: [],
    );
  }

  /// `Bún bò Huế is a traditional Vietnamese beef noodle soup that originates from Huế, the former imperial capital located in central Vietnam. Renowned for its robust and spicy broth, the dish has a rich history intertwined with the region's cultural heritage.\n\nThe exact origins of bún bò Huế are subject to various accounts. Some narratives trace its inception back to the 16th century during the reign of Lord Nguyễn Hoàng. According to legend, a woman named Ms. Noodles ("Cô Bún") from the village of Cổ Tháp ingeniously combined tender beef with a flavorful broth, creating what is now known as bún bò Huế. \nVINPEARL.COM\n\nAnother perspective suggests that the dish was crafted to satisfy the palates of emperors, epitomizing the essence of Huế—a blend of refinement and robustness. \nSANHOTELSERIES.COM\n\nRegardless of its precise origin, bún bò Huế has evolved over centuries to become a beloved staple of Vietnamese cuisine. Its distinctive combination of spicy, sour, sweet, and salty flavors, along with the aromatic infusion of lemongrass and shrimp paste, reflects the rich culinary traditions of Huế and continues to captivate food enthusiasts both within Vietnam and around the world.`
  String get bun_bo_hue_history {
    return Intl.message(
      'Bún bò Huế is a traditional Vietnamese beef noodle soup that originates from Huế, the former imperial capital located in central Vietnam. Renowned for its robust and spicy broth, the dish has a rich history intertwined with the region\'s cultural heritage.\n\nThe exact origins of bún bò Huế are subject to various accounts. Some narratives trace its inception back to the 16th century during the reign of Lord Nguyễn Hoàng. According to legend, a woman named Ms. Noodles ("Cô Bún") from the village of Cổ Tháp ingeniously combined tender beef with a flavorful broth, creating what is now known as bún bò Huế. \nVINPEARL.COM\n\nAnother perspective suggests that the dish was crafted to satisfy the palates of emperors, epitomizing the essence of Huế—a blend of refinement and robustness. \nSANHOTELSERIES.COM\n\nRegardless of its precise origin, bún bò Huế has evolved over centuries to become a beloved staple of Vietnamese cuisine. Its distinctive combination of spicy, sour, sweet, and salty flavors, along with the aromatic infusion of lemongrass and shrimp paste, reflects the rich culinary traditions of Huế and continues to captivate food enthusiasts both within Vietnam and around the world.',
      name: 'bun_bo_hue_history',
      desc: '',
      args: [],
    );
  }

  /// `Beef Leg Bones`
  String get beef_leg_bones {
    return Intl.message(
      'Beef Leg Bones',
      name: 'beef_leg_bones',
      desc: '',
      args: [],
    );
  }

  /// `Beef Tenderloin`
  String get beef_tenderloin {
    return Intl.message(
      'Beef Tenderloin',
      name: 'beef_tenderloin',
      desc: '',
      args: [],
    );
  }

  /// `Beef Brisket`
  String get beef_brisket {
    return Intl.message(
      'Beef Brisket',
      name: 'beef_brisket',
      desc: '',
      args: [],
    );
  }

  /// `Onion`
  String get onion {
    return Intl.message('Onion', name: 'onion', desc: '', args: []);
  }

  /// `Green Onion`
  String get green_onion {
    return Intl.message('Green Onion', name: 'green_onion', desc: '', args: []);
  }

  /// `Ginger`
  String get ginger {
    return Intl.message('Ginger', name: 'ginger', desc: '', args: []);
  }

  /// `Herb`
  String get herb {
    return Intl.message('Herb', name: 'herb', desc: '', args: []);
  }

  /// `Vegetable`
  String get vegetable {
    return Intl.message('Vegetable', name: 'vegetable', desc: '', args: []);
  }

  /// `Shallot`
  String get shallot {
    return Intl.message('Shallot', name: 'shallot', desc: '', args: []);
  }

  /// `Rock Sugar`
  String get rock_sugar {
    return Intl.message('Rock Sugar', name: 'rock_sugar', desc: '', args: []);
  }

  /// `Salt`
  String get salt {
    return Intl.message('Salt', name: 'salt', desc: '', args: []);
  }

  /// `MSG (Monosodium Glutamate)`
  String get msg {
    return Intl.message(
      'MSG (Monosodium Glutamate)',
      name: 'msg',
      desc: '',
      args: [],
    );
  }

  /// `Rinse the beef bones and meat thoroughly with water, then let them drain.\nCut the brisket into thin, bite-sized slices about the length of three finger joints.\nPlace the bones in a bowl, pour boiling water over them until fully submerged, and blanch for about 3–5 minutes to remove impurities and odors.\nThen, take the bones out and rinse them several times with clean water.`
  String get pho_recipe_step_1 {
    return Intl.message(
      'Rinse the beef bones and meat thoroughly with water, then let them drain.\nCut the brisket into thin, bite-sized slices about the length of three finger joints.\nPlace the bones in a bowl, pour boiling water over them until fully submerged, and blanch for about 3–5 minutes to remove impurities and odors.\nThen, take the bones out and rinse them several times with clean water.',
      name: 'pho_recipe_step_1',
      desc: '',
      args: [],
    );
  }

  /// `Peel the onion, wash it thoroughly, and let it drain. Cut one onion in half for roasting later, while thinly slicing the other two.\nPeel the shallots, then wash them along with the green onions and ginger. Finely chop the green onion leaves, and cut the white stalks into four lengthwise sections.\nPlace the halved onion, shallots, and ginger in a pan and roast over low to medium heat for 3–5 minutes until they become fragrant and slightly charred, then turn off the heat.\nUsing the same pan, add the pho seasoning spices and dry-roast over medium heat for about 4–6 minutes until aromatic. Transfer the spices immediately into a filter bag and tie it securely.`
  String get pho_recipe_step_2 {
    return Intl.message(
      'Peel the onion, wash it thoroughly, and let it drain. Cut one onion in half for roasting later, while thinly slicing the other two.\nPeel the shallots, then wash them along with the green onions and ginger. Finely chop the green onion leaves, and cut the white stalks into four lengthwise sections.\nPlace the halved onion, shallots, and ginger in a pan and roast over low to medium heat for 3–5 minutes until they become fragrant and slightly charred, then turn off the heat.\nUsing the same pan, add the pho seasoning spices and dry-roast over medium heat for about 4–6 minutes until aromatic. Transfer the spices immediately into a filter bag and tie it securely.',
      name: 'pho_recipe_step_2',
      desc: '',
      args: [],
    );
  }

  /// `Place the blanched beef bones, brisket, pho spice bag, and the roasted ingredients from step 2 into a pressure cooker.\nAdd enough water to cover the ingredients, along with 1 teaspoon of salt. Close the lid and simmer for 30 minutes until the beef is tender and the broth develops a naturally sweet flavor.\nAfter that, remove all the ingredients and cut the brisket into bite-sized pieces, about the length of three finger joints.\nTransfer the broth to a large pot to continue cooking. Place it back on the stove and return the spice bag to the pot, simmering over medium heat.\nAdd 200g of rock sugar, 2 tablespoons of seasoning powder, 1 teaspoon of salt, and 1/4 teaspoon of MSG, then stir well.\nLet the broth simmer for another 5–7 minutes until it reaches a rolling boil. Adjust the seasoning to taste, then remove the spice bag, and the broth is ready.`
  String get pho_recipe_step_3 {
    return Intl.message(
      'Place the blanched beef bones, brisket, pho spice bag, and the roasted ingredients from step 2 into a pressure cooker.\nAdd enough water to cover the ingredients, along with 1 teaspoon of salt. Close the lid and simmer for 30 minutes until the beef is tender and the broth develops a naturally sweet flavor.\nAfter that, remove all the ingredients and cut the brisket into bite-sized pieces, about the length of three finger joints.\nTransfer the broth to a large pot to continue cooking. Place it back on the stove and return the spice bag to the pot, simmering over medium heat.\nAdd 200g of rock sugar, 2 tablespoons of seasoning powder, 1 teaspoon of salt, and 1/4 teaspoon of MSG, then stir well.\nLet the broth simmer for another 5–7 minutes until it reaches a rolling boil. Adjust the seasoning to taste, then remove the spice bag, and the broth is ready.',
      name: 'pho_recipe_step_3',
      desc: '',
      args: [],
    );
  }

  /// `And just like that, our beef pho is ready!\nPlace the pho noodles into a bowl, then top with shredded onion, chopped scallions, scallion heads, sliced brisket, and raw beef sirloin. Immediately pour the hot broth over the raw beef to lightly cook it and distribute the broth evenly.\nSprinkle some ground pepper on top, add fresh herbs, and it's ready to enjoy! The rich, naturally sweet broth pairs perfectly with the chewy pho noodles and tender, flavorful beef, enhanced by the fragrant roasted spices, onions, and ginger.\nServe it up and enjoy this delicious meal with your family!`
  String get pho_recipe_step_4 {
    return Intl.message(
      'And just like that, our beef pho is ready!\nPlace the pho noodles into a bowl, then top with shredded onion, chopped scallions, scallion heads, sliced brisket, and raw beef sirloin. Immediately pour the hot broth over the raw beef to lightly cook it and distribute the broth evenly.\nSprinkle some ground pepper on top, add fresh herbs, and it\'s ready to enjoy! The rich, naturally sweet broth pairs perfectly with the chewy pho noodles and tender, flavorful beef, enhanced by the fragrant roasted spices, onions, and ginger.\nServe it up and enjoy this delicious meal with your family!',
      name: 'pho_recipe_step_4',
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
