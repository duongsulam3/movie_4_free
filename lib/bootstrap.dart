import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app.dart';
import 'common/utils/helper/helper.dart';
import 'common/utils/network/app_service.dart';
import 'common/utils/secret/app_secret.dart';
import 'common/di/init_dependencies.dart';
import 'features/movies/data/source/local/home_hive_adapters.dart';
import 'features/movies/data/source/local/home_movies_local_data_source.dart';

Future<void> bootstrap() async {
  await _initHive();

  // Initialize dependencies
  await initDependencies();

  // Initialize singleton network service
  AppService.initialize(baseUrl: AppSecret.baseUrl);

  // Set up HTTP overrides
  HttpOverrides.global = Helper.myHttpOverrides;

  // Run the app
  runApp(const MyApp());
}

Future<void> _initHive() async {
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(10)) {
    Hive.registerAdapter(CategoryModelAdapter());
  }
  if (!Hive.isAdapterRegistered(11)) {
    Hive.registerAdapter(CountryModelAdapter());
  }
  if (!Hive.isAdapterRegistered(12)) {
    Hive.registerAdapter(MovieItemModelAdapter());
  }
  if (!Hive.isAdapterRegistered(13)) {
    Hive.registerAdapter(RecentlyUpdateListItemModelAdapter());
  }
  await Hive.openBox<dynamic>(HomeMoviesLocalDataSourceImpl.boxName);
}
