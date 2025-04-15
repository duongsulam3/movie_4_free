part of 'nguonc_movie_detail_bloc.dart';

@freezed
abstract class NguoncMovieDetailState with _$NguoncMovieDetailState {
  const NguoncMovieDetailState._();
  const factory NguoncMovieDetailState([
    @Default(DetailMovieStatus.init) DetailMovieStatus status,
    @Default(null) NguoncMovieEntity? movie,
    @Default("") String passingUrl,
    @Default("") String passingEpisode,
  ]) = _NguoncMovieDetailState;
}
