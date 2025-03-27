import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smoth_movie_app/core/utils/theme/theme.dart';
import 'package:smoth_movie_app/core/utils/helper/helper.dart';
import 'package:smoth_movie_app/init_dependencies.dart';
import 'package:smoth_movie_app/router/app_router.dart';

Future<void> main() async {
  await initDependencies();
  HttpOverrides.global = Helper.myHttpOverrides;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.blackTheme,
      onGenerateRoute: (settings) => AppRouter().onGenerateRoute(settings),
    );
  }
}
