part of 'kho_phim_movies_bloc.dart';

@freezed
abstract class KhoPhimMoviesState with _$KhoPhimMoviesState {
  const KhoPhimMoviesState._();
  const factory KhoPhimMoviesState([
    @Default(KhoPhimMoviesStateStatus.init) KhoPhimMoviesStateStatus status,
    @Default(1) int page,
    @Default("") String countrySlug,
    @Default("") String categorySlug,
    @Default("") String langSlug,
    @Default("") String yearSlug,
    @Default([]) List<MovieItemEntity> movies,
    @Default(false) bool isEnd,
  ]) = _KhoPhimMoviesState;
}
