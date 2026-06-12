import 'package:hive_flutter/hive_flutter.dart';
import 'package:smoth_movie_app/common/local/hive_boxes.dart';

class LocaleRepository {
  LocaleRepository({Box<dynamic>? settingsBox})
      : _settingsBox = settingsBox ?? Hive.box<dynamic>(HiveBoxes.settings);

  final Box<dynamic> _settingsBox;

  String? load() {
    final stored = _settingsBox.get(HiveKeys.locale);
    if (stored is! String || stored.isEmpty) return null;
    return stored;
  }

  Future<void> save(String languageCode) async {
    await _settingsBox.put(HiveKeys.locale, languageCode);
  }
}
