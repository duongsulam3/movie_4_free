import 'dart:io';

import 'package:flutter_supper_app_core/core.dart';

import 'app.dart';
import 'common/local/hive_manager.dart';
import 'common/utils/helper/helper.dart';
import 'common/utils/network/app_service.dart';
import 'common/utils/secret/app_secret.dart';
import 'common/di/init_dependencies.dart';

Future<void> bootstrap() async {
  final Logger logger = const Logger(className: "bootstrap");

  await runZonedGuarded(() async {
    await HiveManager.init();

    // Initialize dependencies
    await initDependencies();

    // Initialize singleton network service
    AppService.initialize(baseUrl: AppSecret.baseUrl);

    // Set up HTTP overrides
    HttpOverrides.global = Helper.myHttpOverrides;

    // Run the app
    runApp(const MyApp());
  }, (error, stackTrace) {
    // Handle uncaught errors
    logger.error(
      "bootstrap",
      "Uncaught error: $error\n$stackTrace",
    );
  });
}
