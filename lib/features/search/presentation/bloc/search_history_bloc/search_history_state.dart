part of 'search_history_bloc.dart';

@freezed
abstract class SearchHistoryState with _$SearchHistoryState {
  const SearchHistoryState._();
  const factory SearchHistoryState([
    @Default([]) List<String> history,
  ]) = _SearchHistoryState;
}
