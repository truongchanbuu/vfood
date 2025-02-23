import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../../cores/constants/colors.dart';
import '../../../../cores/constants/font_sizes.dart';
import '../../../../cores/constants/spacing.dart';
import '../../../../cores/extensions/context_extension.dart';
import '../../../../generated/l10n.dart';
import '../../../shared/presentations/widgets/default_app_bar.dart';
import '../bloc/update_info/update_info_cubit.dart';

class UpdateDisplayNamePage extends StatefulWidget {
  const UpdateDisplayNamePage({super.key});

  @override
  State<UpdateDisplayNamePage> createState() => _UpdateDisplayNamePageState();
}

class _UpdateDisplayNamePageState extends State<UpdateDisplayNamePage> {
  late final FocusNode _focusNode;
  late String _displayName;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode()..requestFocus();
    _displayName = '';
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
            appBar: defaultAppBar(context: context),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.marginL),
                child: Column(
                  children: [
                    TextFormField(
                      focusNode: _focusNode,
                      decoration: InputDecoration(
                        labelText: S.current.display_name_field,
                        labelStyle: TextStyle(color: textColor),
                        prefixIcon:
                            Icon(Icons.person_outline, color: textColor),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            AppSpacing.radiusM,
                          ),
                        ),
                      ),
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        setState(() {
                          _displayName = value;
                        });
                      },
                      onFieldSubmitted: _displayName.isNotEmpty
                          ? (value) => _onUpdate()
                          : null,
                    ),
                    const SizedBox(height: AppSpacing.marginL),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _displayName.isEmpty ? null : _onUpdate,
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
    if (_displayName.isEmpty) return;
    context.read<UpdateInfoCubit>().updateDisplayName(_displayName);
  }
}
