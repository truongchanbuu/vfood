import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../../cores/constants/colors.dart';
import '../../../../cores/constants/font_sizes.dart';
import '../../../../cores/constants/spacing.dart';
import '../../../../cores/extensions/context_extension.dart';
import '../../../../generated/l10n.dart';
import '../../../auth/data/models/phone.dart';
import '../../../shared/presentations/widgets/default_app_bar.dart';
import '../bloc/update_info/update_info_cubit.dart';

class UpdatePhonePage extends StatefulWidget {
  const UpdatePhonePage({super.key});

  @override
  State<UpdatePhonePage> createState() => _UpdatePhonePageState();
}

class _UpdatePhonePageState extends State<UpdatePhonePage> {
  late Phone _phoneNumber;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _phoneNumber = const Phone.pure();
    _focusNode = FocusNode()..requestFocus();
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
                      onChanged: (value) {
                        setState(() {
                          _phoneNumber = Phone.dirty(value);
                        });
                      },
                      decoration: InputDecoration(
                        labelText: S.current.phone_number_field,
                        labelStyle: TextStyle(color: textColor),
                        prefixIcon:
                            Icon(Icons.phone_outlined, color: textColor),
                        border: const OutlineInputBorder(),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.primary),
                        ),
                        floatingLabelStyle: TextStyle(
                          color: _phoneNumber.isNotValid && !_phoneNumber.isPure
                              ? Colors.red
                              : null,
                        ),
                        errorText: _phoneNumber.isValid || _phoneNumber.isPure
                            ? null
                            : S.current.invalid_phone,
                      ),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      textInputAction: TextInputAction.send,
                      keyboardType: TextInputType.phone,
                      onFieldSubmitted:
                          _phoneNumber.isValid ? (val) => _onSubmit() : null,
                    ),
                    const SizedBox(height: AppSpacing.marginL),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _phoneNumber.isNotValid ? null : _onSubmit,
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

  void _onSubmit() {
    context.read<UpdateInfoCubit>().updatePhoneNumber(_phoneNumber.value);
  }
}
