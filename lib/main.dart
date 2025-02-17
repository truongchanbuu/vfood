import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/localization/app_localization.dart';
import 'config/routes/app_router.dart';
import 'config/themes/app_theme.dart';
import 'cores/constants/commons.dart';
import 'features/settings/presentations/bloc/settings_cubit.dart';
import 'firebase_options.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  initializeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt.get<SettingsCubit>()),
      ],
      child: const AppContainer(),
    );
  }
}

class AppContainer extends StatelessWidget {
  const AppContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: AppCommons.appName,
      theme: AppTheme.lightTheme,
      routerConfig: AppRouter.appRouter,
      localizationsDelegates: AppLocalization.delegates,
      supportedLocales: AppLocalization.supportedLanguages,
    );
  }
}
