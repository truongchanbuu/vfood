import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'config/localization/app_localization.dart';
import 'config/routes/app_router.dart';
import 'config/themes/app_theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'VFood',
      theme: AppTheme.lightTheme,
      routerConfig: AppRouter.appRouter,
      localizationsDelegates: AppLocalization.delegates,
      supportedLocales: AppLocalization.supportedLanguages,
    );
  }
}
