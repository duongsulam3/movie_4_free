part of 'kho_phim_movies_bloc.dart';

@immutable
sealed class KhoPhimMoviesEvent {
  const KhoPhimMoviesEvent();
}

class GetKhoPhimMoviesEvent extends KhoPhimMoviesEvent {
  final String countrySlug;
  final String sortField;
  final String sortType;
  final String lang;
  final String categorySlug;
  final String year;
  final int limit;
  const GetKhoPhimMoviesEvent({
    required this.countrySlug,
    this.sortField = "_id",
    this.sortType = "asc",
    required this.lang,
    required this.categorySlug,
    required this.year,
    this.limit = 24,
  });
}
