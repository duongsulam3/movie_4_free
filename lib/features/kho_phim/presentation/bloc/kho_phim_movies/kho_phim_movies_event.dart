part of 'kho_phim_movies_bloc.dart';

@freezed
abstract class KhoPhimMoviesQuery with _$KhoPhimMoviesQuery {
  const factory KhoPhimMoviesQuery({
    required String countrySlug,
    required String lang,
    required String categorySlug,
    required String year,
    @Default('_id') String sortField,
    @Default('asc') String sortType,
    @Default(24) int limit,
  }) = _KhoPhimMoviesQuery;
}

@freezed
abstract class KhoPhimMoviesEvent with _$KhoPhimMoviesEvent {
  const factory KhoPhimMoviesEvent.getMovies(
    KhoPhimMoviesQuery query,
  ) = FetchKhoPhimMovies;

  const factory KhoPhimMoviesEvent.loadMore(
    KhoPhimMoviesQuery query,
  ) = LoadMoreKhoPhimMovies;
}
