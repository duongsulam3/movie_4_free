part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}

class GetSearchMoviesEvent extends SearchEvent {
  final String query;
  final int limit;
  GetSearchMoviesEvent({required this.query, required this.limit});
}
