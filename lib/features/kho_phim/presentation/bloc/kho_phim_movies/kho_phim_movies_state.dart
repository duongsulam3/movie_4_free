part of 'kho_phim_movies_bloc.dart';

@freezed
abstract class KhoPhimMoviesState with _$KhoPhimMoviesState {
  const KhoPhimMoviesState._();
  const factory KhoPhimMoviesState([
    @Default(MoviesStateStatus.init) MoviesStateStatus status,
    @Default(1) int page,
    @Default([]) List<MovieItemEntity> movies,
    @Default(false) bool isEnd,
  ]) = _KhoPhimPageState;
}
