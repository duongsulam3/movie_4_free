import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smoth_movie_app/core/app.dart';
import 'package:smoth_movie_app/core/utils/helper/helper.dart';
import 'package:smoth_movie_app/core/init_dependencies.dart';

Future<void> bootstrap() async {
  // Initialize dependencies
  await initDependencies();

  // Set up HTTP overrides
  HttpOverrides.global = Helper.myHttpOverrides;

  // Run the app
  runApp(const MyApp());
}
