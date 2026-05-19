import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/features/search/domain/usecase/clear_search_history.dart';
import 'package:smoth_movie_app/features/search/domain/usecase/delete_search_keyword.dart';
import 'package:smoth_movie_app/features/search/domain/usecase/get_search_history.dart';
import 'package:smoth_movie_app/features/search/domain/usecase/save_search_keyword.dart';

class SearchHistoryCubit extends Cubit<List<String>> {
  SearchHistoryCubit({
    required this.getSearchHistory,
    required this.saveSearchKeyword,
    required this.deleteSearchKeyword,
    required this.clearSearchHistory,
  }) : super(const []) {
    loadHistory();
  }

  final GetSearchHistory getSearchHistory;
  final SaveSearchKeyword saveSearchKeyword;
  final DeleteSearchKeyword deleteSearchKeyword;
  final ClearSearchHistory clearSearchHistory;

  Future<void> loadHistory() async {
    final res = await getSearchHistory.call();
    res.fold(
      (_) => emit(const []),
      (data) => emit(data),
    );
  }

  Future<void> addKeyword(String keyword) async {
    final trimmed = keyword.trim();
    if (trimmed.isEmpty) return;

    final res = await saveSearchKeyword.call(
      SaveSearchKeywordParams(keyword: trimmed),
    );
    if (res.isRight()) {
      await loadHistory();
    }
  }

  Future<void> removeKeyword(String keyword) async {
    final res = await deleteSearchKeyword.call(
      DeleteSearchKeywordParams(keyword: keyword),
    );
    if (res.isRight()) {
      await loadHistory();
    }
  }

  Future<void> clearAll() async {
    final res = await clearSearchHistory.call();
    if (res.isRight()) {
      emit(const []);
    }
  }
}
