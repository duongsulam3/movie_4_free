import 'package:flutter/material.dart';
import 'package:smoth_movie_core/core.dart';

import 'common/router/app_router.dart';
import 'common/utils/theme/theme.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter route = AppRouter();

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: "Movies For Free",
          debugShowCheckedModeBanner: false,
          theme: AppTheme.blackTheme,
          initialRoute: AppRouter.splash,
          onGenerateRoute: route.onGenerateRoute,
          onUnknownRoute: route.unknownRoute,
        );
      },
    );
  }
}
