import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../config/log/app_logger.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../injection_container.dart';

part 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit() : super(ContactInitial());

  final AppLogger _appLogger = getIt.get<AppLogger>();

  Future<void> contactWithPhone() async {
    try {
      final Uri phoneUri = Uri(scheme: 'tel', path: '+84123456789');
      if (await canLaunchUrl(phoneUri)) {
        await launchUrl(phoneUri);
        emit(ContactSuccess());
      } else {
        emit(ContactFailure(S.current.phone_contact_error));
      }
    } catch (e) {
      _appLogger.e(e);
      emit(ContactFailure(S.current.unknown_exception));
    }
  }

  Future<void> contactWithFb() async {
    try {
      final Uri fbUri = Uri.parse('https://www.facebook.com/vietfoodapp');

      if (await canLaunchUrl(fbUri)) {
        await launchUrl(fbUri, mode: LaunchMode.externalApplication);
      } else {
        emit(ContactFailure(S.current.fb_contact_error));
      }
    } catch (e) {
      _appLogger.e(e);
      emit(ContactFailure(S.current.unknown_exception));
    }
  }

  Future<void> contactWithMail() async {
    try {
      final Uri emailUri = Uri(
        scheme: 'mailto',
        path: 'support@vietfoodapp.com',
        queryParameters: {
          'subject': S.current.email_subject_contact,
          'body': '''
            ${S.current.email_receiver},
            ${S.current.email_body_contact}
          ''',
        },
      );

      if (await canLaunchUrl(emailUri)) {
        await launchUrl(emailUri);
      } else {
        emit(ContactFailure(S.current.email_contact_error));
      }
    } catch (e) {
      _appLogger.e(e);
      emit(ContactFailure(S.current.unknown_exception));
    }
  }
}
