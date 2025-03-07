import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../cores/constants/colors.dart';
import '../../../../cores/constants/commons.dart';
import '../../../../cores/constants/font_sizes.dart';
import '../../../../cores/constants/spacing.dart';
import '../../../../cores/extensions/context_extension.dart';
import '../../../../cores/extensions/string_extension.dart';
import '../../../../generated/l10n.dart';
import '../../../../injection_container.dart';
import '../../../auth/presentations/bloc/auth_bloc/auth_bloc.dart';
import '../../../auth/presentations/bloc/login/login_cubit.dart';
import '../../../shared/presentations/widgets/default_app_bar.dart';
import '../bloc/update_info/update_info_cubit.dart';
import '../widgets/re_auth_bottom_sheet.dart';
import '../widgets/user_avatar.dart';
import 'update_display_name_page.dart';
import 'update_email_page.dart';
import 'update_password_page.dart';
import 'update_phone_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const SizedBox _spacing = SizedBox(height: AppSpacing.marginXL);
  @override
  Widget build(BuildContext context) {
    final currentUser =
        context.select((AuthBloc authBloc) => authBloc.state.user);

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStatus.unauthenticated) {
          Navigator.pop(context);
        }
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor:
              context.isDarkMode ? AppColors.textDark : AppColors.textLight,
          appBar: DefaultAppBar(title: S.current.profile_title),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.marginM),
              child: Column(
                children: [
                  // Profile Picture and Name
                  GestureDetector(
                    onTap: () => _onPickImage(context),
                    child: UserAvatar(
                      username: currentUser.username ?? '',
                      email: currentUser.email ?? '',
                      photoUrl: currentUser.avatarUrl,
                      updatedAt: currentUser.updatedAt,
                    ),
                  ),
                  _spacing,

                  // Profile Fields
                  _buildProfileField(
                    context: context,
                    icon: Icons.email_outlined,
                    title: 'Email',
                    value: currentUser.email ?? '',
                    onTap: () => _onEmailChanged(context),
                  ),
                  const SizedBox(height: AppSpacing.marginM),
                  _buildProfileField(
                    context: context,
                    icon: Icons.person_outline,
                    title: S.current.display_name_field,
                    value: currentUser.username ?? '',
                    onTap: () => _onDisplayNameChanged(context),
                  ),
                  const SizedBox(height: AppSpacing.marginM),
                  _buildProfileField(
                    context: context,
                    icon: Icons.phone_outlined,
                    title: S.current.phone_number_field,
                    value: currentUser.phoneNumber?.obscure ?? '',
                    onTap: () => _onPhoneChanged(context),
                  ),
                  if (currentUser.provider == 'password') ...[
                    const SizedBox(height: AppSpacing.marginM),
                    _buildProfileField(
                      context: context,
                      icon: Icons.lock_outline,
                      title: S.current.password_field,
                      value: '•••',
                      onTap: () => _onPasswordChanged(context),
                    ),
                  ],

                  _spacing,

                  // Logout Button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () =>
                          context.read<AuthBloc>().add(LogoutRequest()),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppColors.primary),
                        padding: const EdgeInsets.symmetric(
                          vertical: AppSpacing.paddingL,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(AppSpacing.radiusS),
                        ),
                      ),
                      child: Text(
                        S.current.logout_button,
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontSize: AppFontSize.labelLarge,
                          fontWeight: FontWeight.bold,
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

  Widget _buildProfileField({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String value,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.paddingL),
        decoration: BoxDecoration(
          color: context.isDarkMode ? AppColors.textDark : AppColors.textLight,
          borderRadius: BorderRadius.circular(AppSpacing.radiusS),
          border: Border.all(color: Colors.grey.shade400),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.grey),
            const SizedBox(width: AppSpacing.marginS),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: AppFontSize.bodyMedium,
                  color: Colors.grey,
                ),
                maxLines: 2,
              ),
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: AppFontSize.bodyMedium,
                color: context.isDarkMode
                    ? AppColors.textLight
                    : AppColors.textDark,
              ),
            ),
            const SizedBox(width: AppSpacing.marginS),
            const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 14),
          ],
        ),
      ),
    );
  }

  Future<void> _onEmailChanged(BuildContext context) async {
    final navigator = Navigator.of(context);
    final isAuthenticated = (await _showReAuthForm(context)) ?? false;
    if (!isAuthenticated) return;

    navigator.push(
      PageTransition(
        type: PageTransitionType.bottomToTop,
        duration: AppCommons.pageTransitionDuration,
        reverseDuration: AppCommons.pageTransitionDuration,
        child: BlocProvider(
          create: (_) => getIt.get<UpdateInfoCubit>(),
          child: const UpdateEmailPage(),
        ),
      ),
    );
  }

  void _onDisplayNameChanged(BuildContext context) {
    Navigator.of(context).push(
      PageTransition(
        type: PageTransitionType.bottomToTop,
        duration: AppCommons.pageTransitionDuration,
        reverseDuration: AppCommons.pageTransitionDuration,
        child: BlocProvider(
          create: (context) => getIt.get<UpdateInfoCubit>(),
          child: const UpdateDisplayNamePage(),
        ),
      ),
    );
  }

  Future<void> _onPhoneChanged(BuildContext context) async {
    final navigator = Navigator.of(context);
    final isAuthenticated = await _showReAuthForm(context);

    if (isAuthenticated ?? false) {
      navigator.push(PageTransition(
        type: PageTransitionType.bottomToTop,
        duration: AppCommons.pageTransitionDuration,
        reverseDuration: AppCommons.pageTransitionDuration,
        child: BlocProvider(
          create: (context) => getIt.get<UpdateInfoCubit>(),
          child: const UpdatePhonePage(),
        ),
      ));
    }
  }

  Future<void> _onPasswordChanged(BuildContext context) async {
    final navigator = Navigator.of(context);
    final isAuthenticated = (await _showReAuthForm(context)) ?? false;
    if (!isAuthenticated) return;

    navigator.push(
      PageTransition(
        type: PageTransitionType.bottomToTop,
        duration: AppCommons.pageTransitionDuration,
        reverseDuration: AppCommons.pageTransitionDuration,
        child: BlocProvider(
          create: (_) => getIt.get<UpdateInfoCubit>(),
          child: const UpdatePasswordPage(),
        ),
      ),
    );
  }

  Future<bool?> _showReAuthForm(BuildContext context) async {
    return await showModalBottomSheet(
      context: context,
      useSafeArea: true,
      shape: const BeveledRectangleBorder(),
      builder: (_) => BlocProvider(
        create: (context) => getIt.get<LoginCubit>(),
        child: const ReAuthBottomSheet(),
      ),
    );
  }

  Future<void> _onPickImage(BuildContext context) async {
    context.read<UpdateInfoCubit>().pickImage();
  }
}
