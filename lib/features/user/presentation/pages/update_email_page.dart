import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../../cores/constants/colors.dart';
import '../../../../cores/constants/font_sizes.dart';
import '../../../../cores/constants/spacing.dart';
import '../../../../cores/extensions/context_extension.dart';
import '../../../../generated/l10n.dart';
import '../../../auth/data/models/email.dart';
import '../../../shared/presentations/widgets/default_app_bar.dart';
import '../bloc/update_info/update_info_cubit.dart';

class UpdateEmailPage extends StatefulWidget {
  const UpdateEmailPage({super.key});

  @override
  State<UpdateEmailPage> createState() => _UpdateEmailPageState();
}

class _UpdateEmailPageState extends State<UpdateEmailPage> {
  late final FocusNode _focusNode;
  late Email _email;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode()..requestFocus();
    _email = const Email.pure();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

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
            description: Text(S.current.verified_email_sent),
            onToastClosed: () => Navigator.pop(context),
          ).show(context);
        }
      },
      child: GestureDetector(
        onTap: () => _focusNode.unfocus(),
        child: SafeArea(
          child: Scaffold(
            appBar: const DefaultAppBar(),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.marginL),
                child: Column(
                  children: [
                    TextFormField(
                      focusNode: _focusNode,
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
                          color: _email.isNotValid ? Colors.red : null,
                        ),
                        errorText: _email.displayError != null
                            ? S.current.invalid_email
                            : null,
                      ),
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        setState(() {
                          _email = Email.dirty(value);
                        });
                      },
                      onFieldSubmitted:
                          _email.isValid ? (value) => _onUpdate() : null,
                    ),
                    const SizedBox(height: AppSpacing.marginL),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _email.isValid ? _onUpdate : null,
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
      ),
    );
  }

  void _onUpdate() {
    if (_email.isNotValid) return;
    context.read<UpdateInfoCubit>().updateEmail(_email.value);
  }
}
