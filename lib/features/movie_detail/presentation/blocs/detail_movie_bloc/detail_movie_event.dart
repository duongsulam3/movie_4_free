part of 'detail_movie_bloc.dart';

@immutable
sealed class DetailMovieEvent {
  const DetailMovieEvent();
}

class GetRecentlyUpdateMovies extends DetailMovieEvent {}

class GetMovieDetailEvent extends DetailMovieEvent {
  final String slug;
  const GetMovieDetailEvent({required this.slug});
}

class GetSingleMoviesEvent extends DetailMovieEvent {}

class GetAnimeMoviesEvent extends DetailMovieEvent {}
