part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}

class GetSearchMoviesEvent extends SearchEvent {
  final String query;
  final int limit;
  GetSearchMoviesEvent({required this.query, required this.limit});
}

class SearchQueryChangedEvent extends SearchEvent {
  final String query;

  SearchQueryChangedEvent({required this.query});
}

class FetchSearchSuggestionsEvent extends SearchEvent {
  final String query;
  final int limit;

  FetchSearchSuggestionsEvent({
    required this.query,
    this.limit = 8,
  });
}

class ClearSearchSuggestionsEvent extends SearchEvent {}
