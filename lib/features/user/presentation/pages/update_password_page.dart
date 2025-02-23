import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../../../cores/constants/colors.dart';
import '../../../../cores/constants/font_sizes.dart';
import '../../../../cores/constants/spacing.dart';
import '../../../../cores/extensions/context_extension.dart';
import '../../../../generated/l10n.dart';
import '../../../auth/data/models/confirm_password.dart';
import '../../../auth/data/models/password.dart';
import '../../../shared/presentations/widgets/default_app_bar.dart';
import '../bloc/update_info/update_info_cubit.dart';

class UpdatePasswordPage extends StatefulWidget {
  const UpdatePasswordPage({super.key});

  @override
  State<UpdatePasswordPage> createState() => _UpdatePasswordPageState();
}

class _UpdatePasswordPageState extends State<UpdatePasswordPage> {
  late final FocusNode _focusNode;
  late Password _password;
  late ConfirmPassword _confirmPassword;
  bool _isPasswordHidden = true;
  bool _isConfirmPasswordHidden = true;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode()..requestFocus();
    _password = const Password.pure();
    _confirmPassword = const ConfirmPassword.pure();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  static const SizedBox _spacing = SizedBox(height: AppSpacing.marginL);
  @override
  Widget build(BuildContext context) {
    final textColor =
        context.isDarkMode ? AppColors.textLight : AppColors.textDark;

    return BlocListener<UpdateInfoCubit, UpdateInfoState>(
      listener: (context, state) {
        if (state is InfoUpdating) {
          context.loaderOverlay.show();
        } else {
          context.loaderOverlay.hide();
        }

        if (state is UpdateFailed) {
          CherryToast.error(
            title: Text(S.current.failure_notification_title),
            description: Text(state.message),
            onToastClosed: () => Navigator.pop(context),
          ).show(context);
        } else if (state is UpdateSucceed) {
          CherryToast.success(
            title: Text(S.current.success_notification_title),
            onToastClosed: () => Navigator.pop(context),
          ).show(context);
        }
      },
      child: SafeArea(
        child: Scaffold(
          appBar: defaultAppBar(context: context),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.marginL),
              child: Column(
                children: [
                  TextFormField(
                    focusNode: _focusNode,
                    obscureText: _isPasswordHidden,
                    decoration: InputDecoration(
                      labelText: S.current.password_field,
                      labelStyle: TextStyle(color: textColor),
                      prefixIcon: Icon(Icons.lock_outline, color: textColor),
                      suffixIcon: GestureDetector(
                        onTap: () => setState(
                          () => _isPasswordHidden = !_isPasswordHidden,
                        ),
                        child: Icon(
                          _isPasswordHidden
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          AppSpacing.radiusM,
                        ),
                      ),
                      floatingLabelStyle: TextStyle(
                        color: _password.isNotValid ? Colors.red : null,
                      ),
                      errorText: _password.displayError != null
                          ? S.current.weak_password
                          : null,
                    ),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.visiblePassword,
                    onChanged: (value) {
                      setState(() {
                        _password = Password.dirty(value);
                        _confirmPassword = ConfirmPassword.dirty(
                          password: _password.value,
                          value: _confirmPassword.value,
                        );
                      });
                    },
                  ),
                  _spacing,
                  TextFormField(
                    obscureText: _isConfirmPasswordHidden,
                    decoration: InputDecoration(
                      labelText: S.current.confirm_password_field,
                      labelStyle: TextStyle(color: textColor),
                      prefixIcon:
                          Icon(Icons.password_outlined, color: textColor),
                      suffixIcon: GestureDetector(
                        onTap: () => setState(
                          () => _isConfirmPasswordHidden =
                              !_isConfirmPasswordHidden,
                        ),
                        child: Icon(
                          _isConfirmPasswordHidden
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          AppSpacing.radiusM,
                        ),
                      ),
                      floatingLabelStyle: TextStyle(
                        color: _confirmPassword.isNotValid &&
                                !_confirmPassword.isPure
                            ? Colors.red
                            : null,
                      ),
                      errorText: _confirmPassword.displayError != null &&
                              !_confirmPassword.isPure
                          ? S.current.different_confirm_password
                          : null,
                    ),
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.visiblePassword,
                    onChanged: (value) {
                      setState(() {
                        _confirmPassword = ConfirmPassword.dirty(
                          password: _password.value,
                          value: value,
                        );
                      });
                    },
                    onFieldSubmitted:
                        _password.isValid && _confirmPassword.isValid
                            ? (value) => _onSubmit()
                            : null,
                  ),
                  _spacing,
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _password.isValid && _confirmPassword.isValid
                          ? _onSubmit
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

  void _onSubmit() {
    context.read<UpdateInfoCubit>().updatePassword(_password.value);
  }
}
