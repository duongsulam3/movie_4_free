part of 'detail_movie_bloc.dart';

// @immutable
// sealed class DetailMovieState {
//   const DetailMovieState();
// }

// final class DetailMovieInitial extends DetailMovieState {
//   final MovieDetailEntity? movieDetail;
//   const DetailMovieInitial(this.movieDetail);
// }

// final class MovieLoadingState extends DetailMovieState {}

// final class GetRecentlyUpdateMoviesStateError extends DetailMovieState {
//   final String message;
//   const GetRecentlyUpdateMoviesStateError({required this.message});
// }

// //!MovieDetail
// final class GetMovieDetailStateSuccess extends DetailMovieState {
//   final MovieDetailEntity movieDetail;
//   const GetMovieDetailStateSuccess({required this.movieDetail});
// }

// final class GetMovieDetailStateError extends DetailMovieState {
//   final String message;
//   const GetMovieDetailStateError({required this.message});
// }

@freezed
abstract class DetailMovieState with _$DetailMovieState {
  const DetailMovieState._();
  const factory DetailMovieState([
    @Default(DetailMovieStatus.init) DetailMovieStatus status,
    @Default(null) MovieDetailEntity? movie,
    @Default("") String passingUrl,
    @Default("") String passingEpisode,
  ]) = _DetailMovieState;
}