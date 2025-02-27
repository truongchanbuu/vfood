import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

import '../../../../cores/constants/font_sizes.dart';
import '../../../../generated/l10n.dart';

class LocationPermissionDialog extends StatelessWidget {
  const LocationPermissionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return GiffyDialog.lottie(
      Lottie.asset('assets/shared/json/location_permission_hero.json'),
      title: Text(
        S.current.permission_required,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: AppFontSize.h3,
        ),
      ),
      content: Text(
        S.current.location_permission_request,
        overflow: TextOverflow.visible,
        maxLines: 5,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text(S.current.not_now_button),
        ),
        FilledButton(
          onPressed: () => Navigator.pop(context, true),
          child: Text(S.current.enable_button),
        ),
      ],
    );
  }
}
