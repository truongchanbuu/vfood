import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import 'package:iconify_flutter_plus/icons/eva.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../generated/l10n.dart';
import '../../../../injection_container.dart';
import '../../../auth/presentations/bloc/auth_bloc/auth_bloc.dart';
import '../../../auth/presentations/bloc/login/login_cubit.dart';
import '../pages/email_re_auth_page.dart';

class ReAuthBottomSheet extends StatelessWidget {
  const ReAuthBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser =
        context.select((AuthBloc authBloc) => authBloc.state.user);

    return BlocListener<LoginCubit, LoginState>(
      listener: (context, loginState) {
        if (loginState is LoginFailed) {
          CherryToast.error(
            title: Text(S.current.failure_notification_title),
            description: Text(S.current.invalid_credential),
            onToastClosed: () => Navigator.pop(context, false),
          ).show(context);
        } else if (loginState is LoginSucceed) {
          CherryToast.success(
            title: Text(S.current.success_notification_title),
            onToastClosed: () => Navigator.pop(context, true),
          ).show(context);
        }
      },
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Iconify(Eva.google_outline, color: Colors.blue),
              title: Text(S.current.re_auth_with_google),
              onTap: context.read<LoginCubit>().reAuthWithGoogle,
            ),
            if (currentUser.provider == 'password')
              ListTile(
                leading: const Icon(Icons.email, color: Colors.red),
                title: Text(S.current.re_auth_with_email),
                onTap: () async {
                  final navigator = Navigator.of(context);
                  bool? isAuth = await Navigator.push(
                    context,
                    PageTransition(
                      child: BlocProvider(
                        create: (context) => getIt.get<LoginCubit>(),
                        child: const EmailReAuthPage(),
                      ),
                      type: PageTransitionType.leftToRight,
                    ),
                  );
                  navigator.pop(isAuth ?? false);
                },
              ),
          ],
        ),
      ),
    );
  }
}
