import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'config/localization/app_localization.dart';
import 'config/routes/app_router.dart';
import 'config/themes/app_theme.dart';
import 'cores/constants/commons.dart';
import 'features/auth/presentations/bloc/auth_bloc/auth_bloc.dart';
import 'features/food/presentations/pages/food_detail_page.dart';
import 'features/settings/presentations/bloc/setting/settings_cubit.dart';
import 'features/shared/presentations/bloc/internet/internet_bloc.dart';
import 'features/shared/presentations/pages/app_view.dart';
import 'features/shared/presentations/widgets/app_loading_indicator.dart';
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
              getIt.get<InternetBloc>()..add(const InternetConnectionChanged()),
        ),
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
    return GlobalLoaderOverlay(
      overlayWidgetBuilder: (progress) => const AppLoadingIndicator(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: AppRouter.navigatorKey,
        title: AppCommons.appName,
        theme: context.select((SettingsCubit settings) =>
            settings.isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme),
        localizationsDelegates: AppLocalization.delegates,
        supportedLocales: AppLocalization.supportedLanguages,
        home: const AppView(),
      ),
    );
  }
}
