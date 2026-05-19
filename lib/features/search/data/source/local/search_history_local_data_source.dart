import 'package:hive/hive.dart';

import '../../../../../common/local/hive_boxes.dart';

abstract interface class SearchHistoryLocalDataSource {
  Future<List<String>> getHistory();
  Future<void> saveKeyword(String keyword);
  Future<void> deleteKeyword(String keyword);
  Future<void> clearHistory();
}

class SearchHistoryLocalDataSourceImpl implements SearchHistoryLocalDataSource {
  SearchHistoryLocalDataSourceImpl(this.box);

  final Box<dynamic> box;
  static const int _maxHistory = 20;

  @override
  Future<List<String>> getHistory() async {
    final raw = box.get(HiveKeys.searchHistory);
    if (raw is! List) return <String>[];
    return List.generate(raw.length, (e) => raw[e].toString());
  }

  @override
  Future<void> saveKeyword(String keyword) async {
    final trimmed = keyword.trim();
    if (trimmed.isEmpty) return;

    List<String> history = await getHistory();

    // Remove duplicate and add to front
    history.removeWhere((item) => item.toLowerCase() == trimmed.toLowerCase());
    history.insert(0, trimmed);

    // Keep only max items
    if (history.length > _maxHistory) {
      history = history.sublist(0, _maxHistory);
    }

    await box.put(HiveKeys.searchHistory, history);
  }

  @override
  Future<void> deleteKeyword(String keyword) async {
    final trimmed = keyword.trim();
    if (trimmed.isEmpty) return;

    List<String> history = await getHistory();
    history.removeWhere((item) => item.toLowerCase() == trimmed.toLowerCase());

    await box.put(HiveKeys.searchHistory, history);
  }

  @override
  Future<void> clearHistory() async {
    await box.delete(HiveKeys.searchHistory);
  }
}
