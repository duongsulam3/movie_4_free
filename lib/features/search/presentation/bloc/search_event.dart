part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}

class GetSearchMoviesEvent extends SearchEvent {
  final String query;
  GetSearchMoviesEvent(this.query);
}
