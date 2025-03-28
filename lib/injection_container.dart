import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/auth/data/models/user.model.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/presentations/bloc/auth_bloc/auth_bloc.dart';
import 'features/auth/presentations/bloc/login/login_cubit.dart';
import 'features/auth/presentations/bloc/reset_password/reset_password_cubit.dart';
import 'features/auth/presentations/bloc/signup/signup_cubit.dart';
import 'features/food/presentations/bloc/find_restaurant/find_restaurant_bloc.dart';
import 'features/search/presentations/bloc/food_search/food_search_cubit.dart';
import 'features/settings/presentations/bloc/contact/contact_cubit.dart';
import 'features/settings/presentations/bloc/setting/settings_cubit.dart';
import 'features/shared/presentations/bloc/internet/internet_bloc.dart';
import 'features/user/presentation/bloc/update_info/update_info_cubit.dart';
import 'services/firestore_service.dart';
import 'services/impl/api_service_impl.dart';

import 'config/api/api_config.dart';
import 'config/log/app_logger.dart';
import 'cores/helpers/cached_client.dart';
import 'features/user/data/repositories/user_repository_impl.dart';
import 'features/user/domain/repositories/user_repository.dart';
import 'services/api_service.dart';
import 'services/impl/firestore_service_impl.dart';

final getIt = GetIt.I;
Future<void> initializeDependencies() async {
  await Hive.initFlutter();

  // Logger
  getIt.registerLazySingleton(() => AppLogger());

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

  // Google Sign in
  getIt.registerFactory<GoogleSignIn>(() => GoogleSignIn.standard());

  // Firebase
  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  getIt.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );
  getIt.registerLazySingleton<FirestoreService<UserModel>>(
    () => FirestoreServiceImpl<UserModel>(
      collectionPath: 'users',
      fromJson: UserModel.fromJson,
      firestore: getIt(),
    ),
  );

  // Repository
  getIt.registerSingleton<UserRepository>(UserRepositoryImpl(getIt()));
  getIt.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(getIt(), getIt(), getIt(), getIt()),
  );

  // Bloc
  getIt.registerSingleton<InternetBloc>(InternetBloc());
  getIt.registerSingleton<AuthBloc>(AuthBloc(getIt()));
  getIt.registerFactory<FindRestaurantBloc>(() => FindRestaurantBloc());

  // Cubit
  getIt.registerSingleton<SettingsCubit>(SettingsCubit(getIt()));
  getIt.registerSingleton<ContactCubit>(ContactCubit());
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));
  getIt.registerFactory<ResetPasswordCubit>(() => ResetPasswordCubit(getIt()));
  getIt.registerFactory<UpdateInfoCubit>(() => UpdateInfoCubit(getIt()));
  getIt.registerFactory<FoodSearchCubit>(() => FoodSearchCubit());
}
