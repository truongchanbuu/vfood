import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/eva.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../cores/constants/colors.dart';
import '../../../../cores/constants/font_sizes.dart';
import '../../../../cores/constants/spacing.dart';
import '../../../../cores/extensions/context_extension.dart';
import '../../../../generated/l10n.dart';
import '../../../../injection_container.dart';
import '../bloc/login/login_cubit.dart';
import '../bloc/reset_password/reset_password_cubit.dart';
import '../bloc/signup/signup_cubit.dart';
import 'reset_password_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isSignUp = false;
  bool _isPasswordObscured = true;
  bool _isConfirmPasswordObscured = true;

  @override
  Widget build(BuildContext context) {
    final textColor =
        context.isDarkMode ? AppColors.textLight : AppColors.textDark;

    final emailError = _isSignUp
        ? context.select((SignUpCubit c) => c.state.email.displayError)
        : context.select((LoginCubit c) => c.state.email.displayError);

    final passwordValidationError = _isSignUp
        ? context.select((SignUpCubit c) => c.state.password.displayError)
        : context.select((LoginCubit c) => c.state.password.displayError);

    final confirmPasswordError = _isSignUp
        ? context
            .select((SignUpCubit c) => c.state.confirmPassword.displayError)
        : null;

    return MultiBlocListener(
      listeners: [
        BlocListener<LoginCubit, LoginState>(
          listener: (loginContext, loginState) {
            if (loginState is LoginInProgressing) {
              context.loaderOverlay.show();
            } else {
              context.loaderOverlay.hide();
            }

            if (loginState is LoginFailed) {
              _showFailedNotification(
                loginState.errorMessage ?? S.current.login_failed,
              );
            } else if (loginState is LoginSucceed) {
              _showSuccessNotification();
            }
          },
        ),
        BlocListener<SignUpCubit, SignUpState>(
          listener: (signUpContext, signUpState) {
            if (signUpState is SignUpInProgressing) {
              context.loaderOverlay.show();
            } else {
              context.loaderOverlay.hide();
            }

            if (signUpState is SignUpFailed) {
              _showFailedNotification(
                signUpState.errorMessage ?? S.current.login_failed,
              );
            } else if (signUpState is SignUpSucceed) {
              _showSuccessNotification();
            }
          },
        ),
      ],
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              iconTheme: IconThemeData(
                color: context.isDarkMode
                    ? AppColors.textLight
                    : AppColors.textDark,
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
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: textColor),
                          prefixIcon:
                              Icon(Icons.email_outlined, color: textColor),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              AppSpacing.radiusM,
                            ),
                          ),
                          floatingLabelStyle: TextStyle(
                            color: emailError != null ? Colors.red : null,
                          ),
                          errorText: emailError != null
                              ? S.current.invalid_email
                              : null,
                        ),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: _isSignUp
                            ? context.read<SignUpCubit>().emailChanged
                            : context.read<LoginCubit>().emailChanged,
                      ),
                      const SizedBox(height: AppSpacing.marginL),

                      // Password input
                      TextFormField(
                        obscureText: _isPasswordObscured,
                        decoration: InputDecoration(
                          labelText: S.current.password_field,
                          labelStyle: TextStyle(color: textColor),
                          prefixIcon:
                              Icon(Icons.lock_outline, color: textColor),
                          suffixIcon: IconButton(
                            onPressed: () => setState(
                              () => _isPasswordObscured = !_isPasswordObscured,
                            ),
                            icon: Icon(
                              _isPasswordObscured
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            color: passwordValidationError != null
                                ? Colors.red
                                : textColor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              AppSpacing.radiusM,
                            ),
                          ),
                          floatingLabelStyle: TextStyle(
                            color: passwordValidationError != null
                                ? Colors.red
                                : null,
                          ),
                          errorText: passwordValidationError != null
                              ? S.current.weak_password
                              : null,
                        ),
                        textInputAction: !_isSignUp
                            ? TextInputAction.done
                            : TextInputAction.next,
                        keyboardType: TextInputType.text,
                        onChanged: _isSignUp
                            ? context.read<SignUpCubit>().passwordChanged
                            : context.read<LoginCubit>().passwordChanged,
                        onFieldSubmitted: !_isSignUp && _isLoginAllowed(context)
                            ? (value) async => await _onLogin()
                            : null,
                      ),
                      const SizedBox(height: AppSpacing.marginL),

                      // Confirm password input (only for sign up)
                      if (_isSignUp) ...[
                        TextFormField(
                          initialValue: context.select(
                            (SignUpCubit signUpCubit) =>
                                signUpCubit.state.confirmPassword.value,
                          ),
                          obscureText: _isConfirmPasswordObscured,
                          decoration: InputDecoration(
                            labelText: S.current.confirm_password_field,
                            labelStyle: TextStyle(color: textColor),
                            prefixIcon:
                                Icon(Icons.lock_outline, color: textColor),
                            suffixIcon: IconButton(
                              onPressed: () => setState(
                                () => _isConfirmPasswordObscured =
                                    !_isConfirmPasswordObscured,
                              ),
                              icon: Icon(
                                _isConfirmPasswordObscured
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              color: confirmPasswordError != null
                                  ? Colors.red
                                  : textColor,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                AppSpacing.radiusM,
                              ),
                            ),
                            floatingLabelStyle: TextStyle(
                              color: confirmPasswordError != null
                                  ? Colors.red
                                  : null,
                            ),
                            errorText: confirmPasswordError != null
                                ? S.current.different_confirm_password
                                : null,
                          ),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          onChanged: context
                              .read<SignUpCubit>()
                              .confirmPasswordChanged,
                          onFieldSubmitted: _isSignUpAllowed(context)
                              ? (value) async => await _onSignUp()
                              : null,
                        ),
                        const SizedBox(height: AppSpacing.marginL),
                      ],

                      // Submit button
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: _isSignUp
                              ? _isSignUpAllowed(context)
                                  ? () async => await _onSignUp()
                                  : null
                              : _isLoginAllowed(context)
                                  ? () async => await _onLogin()
                                  : null,
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                AppSpacing.radiusM,
                              ),
                            ),
                          ),
                          child: Text(
                            _isSignUp
                                ? S.current.sign_up_button
                                : S.current.sign_in_button,
                            style: const TextStyle(
                              fontSize: AppFontSize.bodyLarge,
                            ),
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
                          onPressed: context.read<LoginCubit>().logInWithGoogle,
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                AppSpacing.radiusM,
                              ),
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
                              final signUpCubit = context.read<SignUpCubit>();
                              final loginCubit = context.read<LoginCubit>();

                              final email = _isSignUp
                                  ? signUpCubit.state.email
                                  : loginCubit.state.email;
                              final password = _isSignUp
                                  ? signUpCubit.state.password
                                  : loginCubit.state.password;

                              setState(() {
                                _isSignUp = !_isSignUp;
                              });

                              if (_isSignUp) {
                                if (!email.isPure) {
                                  signUpCubit.emailChanged(email.value);
                                }

                                if (!password.isPure) {
                                  signUpCubit.passwordChanged(password.value);
                                }
                              } else {
                                if (!email.isPure) {
                                  loginCubit.emailChanged(email.value);
                                }

                                if (!password.isPure) {
                                  loginCubit.passwordChanged(password.value);
                                }
                              }
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
                      const SizedBox(height: AppSpacing.marginXS),

                      // Forgot Password
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            final signUpCubit = context.read<SignUpCubit>();
                            final loginCubit = context.read<LoginCubit>();

                            final email = _isSignUp
                                ? signUpCubit.state.email.value
                                : loginCubit.state.email.value;

                            _onResetPasswordPage(email);
                          },
                          child: Text(
                            S.current.forgot_password_title,
                            style: const TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: AppFontSize.labelLarge,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.marginL),

                      // Terms & Policies
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
      ),
    );
  }

  Future<void> _onLogin() async {
    FocusManager.instance.primaryFocus?.unfocus();
    await context.read<LoginCubit>().logInWithCredentials();
  }

  Future<void> _onSignUp() async {
    FocusManager.instance.primaryFocus?.unfocus();
    await context.read<SignUpCubit>().signUpFormSubmitted();
  }

  bool _isLoginAllowed(BuildContext context) {
    return context.select(
      (LoginCubit loginCubit) => loginCubit.state.isValid,
    );
  }

  bool _isSignUpAllowed(BuildContext context) {
    return context.select(
      (SignUpCubit signUpCubit) => signUpCubit.state.isValid,
    );
  }

  void _showFailedNotification(String desc) {
    CherryToast.error(
      title: Text(S.current.failure_notification_title),
      description: Text(desc),
    ).show(context);
  }

  void _showSuccessNotification([VoidCallback? onToastClosed]) {
    CherryToast.success(
      title: Text(S.current.success_notification_title),
      onToastClosed: onToastClosed ??
          () => Navigator.popUntil(
                context,
                ModalRoute.withName('/'),
              ),
    ).show(context);
  }

  void _onResetPasswordPage(String email) {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.leftToRight,
        child: BlocProvider(
          create: (_) => getIt.get<ResetPasswordCubit>()..emailChanged(email),
          child: ResetPasswordPage(email: email),
        ),
      ),
    );
  }
}
