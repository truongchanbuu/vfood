import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/localization/app_localization.dart';
import 'config/themes/app_theme.dart';
import 'cores/constants/commons.dart';
import 'features/auth/presentations/bloc/auth_bloc/auth_bloc.dart';
import 'features/settings/presentations/bloc/setting/settings_cubit.dart';
import 'features/shared/presentations/pages/app_view.dart';
import 'firebase_options.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              getIt.get<AuthBloc>()..add(AuthUserSubscriptionRequest()),
        ),
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppCommons.appName,
      theme: context.select((SettingsCubit settings) =>
          settings.isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme),
      localizationsDelegates: AppLocalization.delegates,
      supportedLocales: AppLocalization.supportedLanguages,
      home: const AppView(),
    );
  }
}
