part of 'search_history_bloc.dart';

@freezed
class SearchHistoryEvent with _$SearchHistoryEvent {
  const factory SearchHistoryEvent.load() = LoadSearchHistoryEvent;
  const factory SearchHistoryEvent.add(String keyword) = AddSearchKeywordEvent;
  const factory SearchHistoryEvent.delete(String keyword) = DeleteSearchKeywordEvent;
  const factory SearchHistoryEvent.clearAll() = ClearSearchHistoryEvent;
}
