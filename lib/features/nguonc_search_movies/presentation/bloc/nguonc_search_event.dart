part of 'nguonc_search_bloc.dart';

@immutable
sealed class NguoncSearchEvent {}

class GetSearchFilmsEvent extends NguoncSearchEvent {
  final String query;
  GetSearchFilmsEvent({required this.query});
}

class SearchNguoncQueryChangedEvent extends NguoncSearchEvent {
  final String query;
  SearchNguoncQueryChangedEvent({required this.query});
}

class FetchNguoncSearchSuggestionsEvent extends NguoncSearchEvent {
  final String query;
  final int limit;
  FetchNguoncSearchSuggestionsEvent({
    required this.query,
    this.limit = 8,
  });
}

class ClearNguoncSearchSuggestionsEvent extends NguoncSearchEvent {}
