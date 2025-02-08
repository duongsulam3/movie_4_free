part of 'detail_movie_bloc.dart';

@immutable
sealed class DetailMovieState {
  const DetailMovieState();
}

final class DetailMovieInitial extends DetailMovieState {
  final MovieDetailEntity? movieDetail;
  const DetailMovieInitial({required this.movieDetail});
}

final class MovieLoadingState extends DetailMovieState {}

final class GetRecentlyUpdateMoviesStateError extends DetailMovieState {
  final String message;
  const GetRecentlyUpdateMoviesStateError({required this.message});
}

//!MovieDetail
final class GetMovieDetailStateSuccess extends DetailMovieState {
  final MovieDetailEntity movieDetail;
  const GetMovieDetailStateSuccess({required this.movieDetail});
}

final class GetMovieDetailStateError extends DetailMovieState {
  final String message;
  const GetMovieDetailStateError({required this.message});
}
