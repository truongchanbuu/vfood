import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vfood/services/impl/api_service_impl.dart';

import 'config/api/api_config.dart';
import 'config/log/app_logger.dart';
import 'cores/helpers/cached_client.dart';
import 'features/settings/presentations/bloc/settings_cubit.dart';
import 'services/api_service.dart';

final getIt = GetIt.I;
Future<void> initializeDependencies() async {
  // Storage
  getIt.registerSingleton<SharedPreferencesWithCache>(
    await SharedPreferencesWithCache.create(
      cacheOptions: const SharedPreferencesWithCacheOptions(),
    ),
  );
  getIt.registerSingleton<CacheClient>(CacheClient(getIt()));

  // Dio
  getIt.registerSingleton<Dio>(Dio(BaseOptions(baseUrl: ApiConfig.baseUrl)));
  getIt.registerLazySingleton<ApiService>(() => ApiServiceImpl(getIt()));

  // Logger
  getIt.registerLazySingleton(() => AppLogger());

  // Firebase
  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);

  // Cubit
  getIt.registerSingleton<SettingsCubit>(SettingsCubit(getIt()));
}
