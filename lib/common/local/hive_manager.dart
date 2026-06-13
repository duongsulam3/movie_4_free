import 'package:hive_flutter/hive_flutter.dart';

import 'hive_adapters.dart';
import 'hive_boxes.dart';

class HiveManager {
  const HiveManager._();

  static Future<void> init() async {
    await Hive.initFlutter();
    registerHiveAdapters();
    await Hive.openBox<dynamic>(HiveBoxes.homeMoviesCache);
    await Hive.openBox<dynamic>(HiveBoxes.searchHistoryCache);
    await Hive.openBox<dynamic>(HiveBoxes.settings);
  }

  static Box<dynamic> get homeMoviesBox => Hive.box<dynamic>(
        HiveBoxes.homeMoviesCache,
      );

  static Box<dynamic> get searchHistoryBox => Hive.box<dynamic>(
        HiveBoxes.searchHistoryCache,
      );

  static Box<dynamic> get settingsBox => Hive.box<dynamic>(
        HiveBoxes.settings,
      );

  static Future<void> dispose() async {
    await Hive.close();
  }
}
