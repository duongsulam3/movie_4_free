part of 'recently_update_movies_bloc.dart';

@immutable
sealed class RecentlyUpdateMoviesEvent {
  const RecentlyUpdateMoviesEvent();
}

class GetRecentlyUpdateMovies extends RecentlyUpdateMoviesEvent {}
