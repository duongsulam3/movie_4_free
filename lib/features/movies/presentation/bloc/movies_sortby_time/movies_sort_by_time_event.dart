part of 'movies_sort_by_time_bloc.dart';

@immutable
sealed class MoviesSortByTimeEvent {
  const MoviesSortByTimeEvent();
}

class GetSortByTimeMovies extends MoviesSortByTimeEvent {
  final String cateName;
  final int page;
  final int limit;
  final String sortfield;
  const GetSortByTimeMovies({
    required this.cateName,
    required this.page,
    this.limit = 5,
    required this.sortfield,
  });
}
