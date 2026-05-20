import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/usecase/clear_search_history.dart';
import '../../../domain/usecase/delete_search_keyword.dart';
import '../../../domain/usecase/get_search_history.dart';
import '../../../domain/usecase/save_search_keyword.dart';

part 'search_history_event.dart';
part 'search_history_state.dart';
part 'search_history_bloc.freezed.dart';

class SearchHistoryBloc extends Bloc<SearchHistoryEvent, SearchHistoryState> {
  final GetSearchHistory getSearchHistory;
  final SaveSearchKeyword saveSearchKeyword;
  final DeleteSearchKeyword deleteSearchKeyword;
  final ClearSearchHistory clearSearchHistory;

  SearchHistoryBloc({
    required this.getSearchHistory,
    required this.saveSearchKeyword,
    required this.deleteSearchKeyword,
    required this.clearSearchHistory,
  }) : super(const SearchHistoryState()) {
    on<LoadSearchHistoryEvent>(_onLoadSearchHistory);
    on<AddSearchKeywordEvent>(_onAddSearchKeyword);
    on<DeleteSearchKeywordEvent>(_onDeleteSearchKeyword);
    on<ClearSearchHistoryEvent>(_onClearSearchHistory);

    add(const SearchHistoryEvent.load());
  }

  Future<void> _onLoadSearchHistory(
    LoadSearchHistoryEvent event,
    Emitter<SearchHistoryState> emit,
  ) async {
    final res = await getSearchHistory.call();
    res.fold(
      (_) => emit(state.copyWith(history: const [])),
      (data) => emit(state.copyWith(history: data)),
    );
  }

  Future<void> _onAddSearchKeyword(
    AddSearchKeywordEvent event,
    Emitter<SearchHistoryState> emit,
  ) async {
    final trimmed = event.keyword.trim();
    if (trimmed.isEmpty) return;

    final res = await saveSearchKeyword.call(
      SaveSearchKeywordParams(keyword: trimmed),
    );
    if (res.isRight()) {
      add(const SearchHistoryEvent.load());
    }
  }

  Future<void> _onDeleteSearchKeyword(
    DeleteSearchKeywordEvent event,
    Emitter<SearchHistoryState> emit,
  ) async {
    final res = await deleteSearchKeyword.call(
      DeleteSearchKeywordParams(keyword: event.keyword),
    );
    if (res.isRight()) {
      add(const SearchHistoryEvent.load());
    }
  }

  Future<void> _onClearSearchHistory(
    ClearSearchHistoryEvent event,
    Emitter<SearchHistoryState> emit,
  ) async {
    final res = await clearSearchHistory.call();
    if (res.isRight()) {
      emit(state.copyWith(history: const []));
    }
  }
}
