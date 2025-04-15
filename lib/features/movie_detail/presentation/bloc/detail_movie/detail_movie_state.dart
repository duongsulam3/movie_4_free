part of 'detail_movie_bloc.dart';

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