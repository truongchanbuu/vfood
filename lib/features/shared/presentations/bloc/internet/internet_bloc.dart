import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../../../../../config/log/app_logger.dart';
import '../../../../../injection_container.dart';
part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final appLogger = getIt.get<AppLogger>();

  InternetBloc() : super(InternetInitial()) {
    on<CheckInternetConnection>(_checkInternetConnection);
    on<InternetConnectionChanged>(_onInternetConnectionChanged);
  }

  Future<void> _checkInternetConnection(
    CheckInternetConnection event,
    Emitter<InternetState> emit,
  ) async {
    emit(InternetLoading());
    try {
      final isConnected = await InternetConnection().hasInternetAccess;
      if (isConnected) {
        emit(InternetConnected());
      } else {
        emit(InternetDisconnected());
      }
    } catch (e) {
      appLogger.e(e);
      emit(InternetDisconnected());
    }
  }

  Future<void> _onInternetConnectionChanged(
    InternetConnectionChanged event,
    Emitter<InternetState> emit,
  ) async =>
      await emit.onEach(
        InternetConnection().onStatusChange,
        onData: (status) {
          emit(InternetLoading());
          if (status == InternetStatus.connected) {
            emit(InternetConnected());
          } else {
            emit(InternetDisconnected());
          }
        },
        onError: (error, stackTrace) {
          appLogger.e(error);
          emit(InternetDisconnected());
        },
      );
}
