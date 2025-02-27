import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../config/routes/app_router.dart';
import '../../features/shared/presentations/widgets/location_permission_dialog.dart';
import '../../generated/l10n.dart';

class PermissionHelper {
  static Future<bool> isPermissionGranted(Permission permission) async =>
      await permission.isGranted;

  static Future<bool> requestPermission(Permission permission) async =>
      (await permission.request()).isGranted;

  static Future<PermissionStatus> checkAndRequestPermission(
    Permission permission,
  ) async {
    try {
      final status = await permission.status;
      if (status.isGranted) {
        return status;
      }

      if (status.isPermanentlyDenied) {
        final bool openSettings = await showPermanentlyDeniedDialog();

        if (openSettings == true) {
          await openAppSettings();
        }

        return status;
      }

      return await permission.request();
    } catch (e) {
      return PermissionStatus.denied;
    }
  }

  static Future<bool> showPermanentlyDeniedDialog() async {
    final context = AppRouter.navigatorKey.currentContext;

    if (context == null) {
      return false;
    }

    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.current.permission_required),
          content: Text(S.current.open_setting_required_message),
          actions: [
            TextButton(
              child: Text(S.current.cancel_button),
              onPressed: () => Navigator.pop(context, false),
            ),
            TextButton(
              child: Text(S.current.open_setting_button),
              onPressed: () => Navigator.pop(context, true),
            ),
          ],
        );
      },
    );

    return result ?? false;
  }

  static Future<bool> showGrantLocationPermissionDialog() async {
    final context = AppRouter.navigatorKey.currentContext;
    if (context == null) {
      return false;
    }

    return await showDialog(
      context: context,
      builder: (context) => const LocationPermissionDialog(),
    );
  }
}
