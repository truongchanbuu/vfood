import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../config/log/app_logger.dart';
import '../../../../../cores/helpers/permission_helper.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../injection_container.dart';

part 'find_restaurant_event.dart';
part 'find_restaurant_state.dart';

class FindRestaurantBloc
    extends Bloc<FindRestaurantEvent, FindRestaurantState> {
  FindRestaurantBloc() : super(FindRestaurantInitial()) {
    on<RequestLocation>(_onRequestLocation);
    on<OpenMap>(_onOpenMap);
  }

  final AppLogger _appLogger = getIt.get<AppLogger>();

  Future<void> _onRequestLocation(
    RequestLocation event,
    Emitter<FindRestaurantState> emit,
  ) async {
    emit(RestaurantLoading());
    try {
      bool isPermissionGranted =
          await PermissionHelper.isPermissionGranted(Permission.location);

      if (!isPermissionGranted) {
        isPermissionGranted =
            await PermissionHelper.showGrantLocationPermissionDialog();

        if (!isPermissionGranted) {
          emit(LocationPermissionDenied());
          return;
        }

        final status = await PermissionHelper.checkAndRequestPermission(
            Permission.location);

        isPermissionGranted = status.isGranted;

        if (!isPermissionGranted) {
          emit(LocationPermissionDenied());
          return;
        }
      }

      emit(LocationPermissionAllowed());
    } catch (e) {
      _appLogger.e(e);
      emit(FindRestaurantFailed(S.current.unknown_exception));
    }
  }

  Future<void> _onOpenMap(
    OpenMap event,
    Emitter<FindRestaurantState> emit,
  ) async {
    try {
      final googleMapsUrl =
          'https://www.google.com/maps/search/?api=1&query=${event.latitude},${event.longitude}';
      final uri = Uri.parse(googleMapsUrl);

      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
        emit(MapOpened());
      } else {
        emit(MapOpenFailed(S.current.map_opened_failed));
      }
    } catch (e) {
      _appLogger.e(e);
      emit(MapOpenFailed(S.current.map_opened_failed));
    }
  }
}
