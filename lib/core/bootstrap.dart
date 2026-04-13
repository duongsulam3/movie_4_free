import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smoth_movie_app/core/app.dart';
import 'package:smoth_movie_app/core/utils/helper/helper.dart';
import 'package:smoth_movie_app/core/init_dependencies.dart';
import 'package:smoth_movie_app/core/utils/network/app_service.dart';
import 'package:smoth_movie_app/core/utils/secret/app_secret.dart';

Future<void> bootstrap() async {
  // Initialize dependencies
  await initDependencies();

  // Initialize singleton network service
  AppService.initialize(baseUrl: AppSecret.baseUrl + AppSecret.apiv1Url);

  // Set up HTTP overrides
  HttpOverrides.global = Helper.myHttpOverrides;

  // Run the app
  runApp(const MyApp());
}
