import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/auth/data/models/user.model.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/presentations/bloc/auth_bloc/auth_bloc.dart';
import 'services/firestore_service.dart';
import 'services/impl/api_service_impl.dart';

import 'config/api/api_config.dart';
import 'config/log/app_logger.dart';
import 'cores/helpers/cached_client.dart';
import 'features/settings/presentations/bloc/settings_cubit.dart';
import 'features/user/data/repositories/user_repository_impl.dart';
import 'features/user/domain/repositories/user_repository.dart';
import 'services/api_service.dart';
import 'services/impl/firestore_service_impl.dart';

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
  getIt.registerLazySingleton<FirestoreService<UserModel>>(
    () => FirestoreServiceImpl<UserModel>(
      fromJson: UserModel.fromJson,
      collectionPath: 'users',
      firestore: getIt(),
    ),
  );

  // Repository
  getIt.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(getIt(), getIt(), getIt(), getIt()),
  );
  getIt.registerSingleton<UserRepository>(UserRepositoryImpl(getIt()));

  // Bloc
  getIt.registerSingleton<AuthBloc>(AuthBloc(getIt()));

  // Cubit
  getIt.registerSingleton<SettingsCubit>(SettingsCubit(getIt()));
}
