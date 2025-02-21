import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../../cores/constants/colors.dart';
import '../../../../cores/constants/font_sizes.dart';
import '../../../../cores/constants/spacing.dart';
import '../../../../cores/extensions/context_extension.dart';
import '../../../../generated/l10n.dart';
import '../bloc/reset_password/reset_password_cubit.dart';

class ResetPasswordPage extends StatelessWidget {
  final String email;
  const ResetPasswordPage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final textColor =
        context.isDarkMode ? AppColors.textLight : AppColors.textDark;

    final emailError = context.select(
      (ResetPasswordCubit resetCubit) => resetCubit.state.email.displayError,
    );

    return BlocListener<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetEmailSending) {
          context.loaderOverlay.show();
        } else {
          context.loaderOverlay.hide();
        }

        if (state is ResetEmailSentFailed) {
          CherryToast.error(
            title: Text(S.current.failure_notification_title),
            description: Text(state.errorMessage ?? S.current.reset_failed),
          ).show(context);
        } else if (state is ResetEmailSentSucceed) {
          CherryToast.success(
            title: Text(S.current.success_notification_title),
            description: Text(S.current.reset_email_sent),
            onToastClosed: () => Navigator.pop(context),
          ).show(context);
        }
      },
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
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
              child: Column(
                children: [
                  // Email
                  TextFormField(
                    initialValue: email,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: textColor),
                      prefixIcon: Icon(Icons.email_outlined, color: textColor),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          AppSpacing.radiusM,
                        ),
                      ),
                      floatingLabelStyle: TextStyle(
                        color: emailError != null ? Colors.red : null,
                      ),
                      errorText:
                          emailError != null ? S.current.invalid_email : null,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    onChanged: context.read<ResetPasswordCubit>().emailChanged,
                  ),
                  const SizedBox(height: AppSpacing.marginL),

                  // Submit button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: context.select(
                        (ResetPasswordCubit resetCubit) =>
                            resetCubit.state.isValid,
                      )
                          ? context.read<ResetPasswordCubit>().resetPassword
                          : null,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            AppSpacing.radiusM,
                          ),
                        ),
                      ),
                      child: Text(
                        S.current.send_button,
                        style: const TextStyle(
                          fontSize: AppFontSize.bodyLarge,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
