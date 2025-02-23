import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../../cores/constants/colors.dart';
import '../../../../cores/constants/font_sizes.dart';
import '../../../../cores/constants/spacing.dart';
import '../../../../cores/extensions/context_extension.dart';
import '../../../../generated/l10n.dart';
import '../../../auth/presentations/bloc/login/login_cubit.dart';

class EmailReAuthPage extends StatefulWidget {
  const EmailReAuthPage({super.key});

  @override
  State<EmailReAuthPage> createState() => _EmailReAuthPageState();
}

class _EmailReAuthPageState extends State<EmailReAuthPage> {
  late final FocusNode _focusNode;
  bool _isObscure = true;

  @override
  void initState() {
    _focusNode = FocusNode()..requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  // TODO: THERE IS SOMETHING WRONG WITH THE VALIDATOR
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginInProgressing) {
          context.loaderOverlay.show();
        } else {
          context.loaderOverlay.hide();
        }

        if (state is LoginFailed) {
          CherryToast.error(
            title: Text(S.current.failure_notification_title),
            description: Text(S.current.invalid_credential),
          ).show(context);
        } else if (state is LoginSucceed) {
          CherryToast.success(
            title: Text(S.current.success_notification_title),
            onToastClosed: () => Navigator.pop(context, true),
          ).show(context);
        }
      },
      child: GestureDetector(
        onTap: _unFocus,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: context.isDarkMode
                    ? AppColors.textLight
                    : AppColors.textDark,
              ),
              backgroundColor:
                  context.isDarkMode ? AppColors.textDark : AppColors.textLight,
              elevation: 0,
            ),
            body: Padding(
              padding: const EdgeInsets.all(AppSpacing.marginL),
              child: Column(
                children: [
                  TextFormField(
                    focusNode: _focusNode,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      labelText: S.current.password_field,
                      suffixIcon: IconButton(
                        onPressed: () =>
                            setState(() => _isObscure = !_isObscure),
                        icon: _isObscure
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                      ),
                      border: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.primary),
                      ),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.send,
                    onFieldSubmitted: (val) => _reAuth(),
                    onChanged: context.read<LoginCubit>().passwordChanged,
                  ),
                  const SizedBox(height: AppSpacing.marginL),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: context.select(
                        (LoginCubit loginCubit) =>
                            loginCubit.state.password.value.isNotEmpty,
                      )
                          ? _reAuth
                          : null,
                      child: Text(
                        S.current.send_button,
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: AppFontSize.h4,
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

  void _reAuth() {
    _unFocus();
    context.read<LoginCubit>().reAuthenticate();
  }

  void _unFocus() {
    _focusNode.unfocus();
  }
}
