import 'package:flutter/material.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/eva.dart';

import '../../../../cores/constants/colors.dart';
import '../../../../cores/constants/font_sizes.dart';
import '../../../../cores/constants/spacing.dart';
import '../../../../cores/extensions/context_extension.dart';
import '../../../../generated/l10n.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isSignUp = false;

  @override
  Widget build(BuildContext context) {
    final textColor =
        context.isDarkMode ? AppColors.textLight : AppColors.textDark;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(
              color:
                  context.isDarkMode ? AppColors.textLight : AppColors.textDark,
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.paddingL),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    // Logo or app name
                    Center(
                      child: Text(
                        _isSignUp
                            ? S.current.create_account_title
                            : S.current.welcome_title,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),

                    // Email input
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: textColor),
                        prefixIcon:
                            Icon(Icons.email_outlined, color: textColor),
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(AppSpacing.radiusM),
                        ),
                      ),
                      validator: (value) {},
                    ),
                    const SizedBox(height: AppSpacing.marginL),

                    // Password input
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: S.current.password_field,
                        labelStyle: TextStyle(color: textColor),
                        prefixIcon: Icon(Icons.lock_outline, color: textColor),
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(AppSpacing.radiusM),
                        ),
                      ),
                      validator: (value) {},
                    ),
                    const SizedBox(height: AppSpacing.marginL),

                    // Confirm password input (only for sign up)
                    if (_isSignUp) ...[
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: S.current.confirm_password_field,
                          labelStyle: TextStyle(color: textColor),
                          prefixIcon:
                              Icon(Icons.lock_outline, color: textColor),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(AppSpacing.radiusM),
                          ),
                        ),
                        validator: (value) {},
                      ),
                      const SizedBox(height: AppSpacing.marginL),
                    ],

                    // Submit button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(AppSpacing.radiusM),
                          ),
                        ),
                        child: Text(
                          _isSignUp
                              ? S.current.sign_up_button
                              : S.current.sign_in_button,
                          style:
                              const TextStyle(fontSize: AppFontSize.bodyLarge),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.marginL),

                    // Google sign-in button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: OutlinedButton.icon(
                        icon: const Iconify(
                          Eva.google_outline,
                          size: 24,
                        ),
                        label: Text(
                          S.current.continue_with_google_button,
                          style: const TextStyle(
                            color: AppColors.textGray,
                            fontSize: AppFontSize.bodyLarge,
                          ),
                        ),
                        onPressed: () {
                          // Implement Google sign-in
                        },
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(AppSpacing.radiusM),
                          ),
                          side: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.marginXL),

                    // Toggle between sign in/sign up
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _isSignUp
                              ? "${S.current.already_have_account_title} "
                              : "${S.current.do_not_have_account_title} ",
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isSignUp = !_isSignUp;
                            });
                          },
                          child: Text(
                            _isSignUp
                                ? S.current.sign_in_button
                                : S.current.sign_up_button,
                            style: const TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.marginL),
                    Text(
                      S.current.terms_of_service_and_privacy_policy,
                      style: const TextStyle(color: AppColors.textGray),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
