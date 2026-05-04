import 'dart:io';

import 'package:flutter/material.dart';

import 'app.dart';
import 'common/core/utils/helper/helper.dart';
import 'common/core/utils/network/app_service.dart';
import 'common/core/utils/secret/app_secret.dart';
import 'common/di/init_dependencies.dart';

Future<void> bootstrap() async {
  // Initialize dependencies
  await initDependencies();

  // Initialize singleton network service
  AppService.initialize(baseUrl: AppSecret.baseUrl);

  // Set up HTTP overrides
  HttpOverrides.global = Helper.myHttpOverrides;

  // Run the app
  runApp(const MyApp());
}
