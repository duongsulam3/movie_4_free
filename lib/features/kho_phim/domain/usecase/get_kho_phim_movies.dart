import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/core/error/failure.dart';
import 'package:smoth_movie_app/core/usecase/usecase.dart';
import 'package:smoth_movie_app/features/kho_phim/domain/repository/kho_phim_movies_repository.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';

class GetKhoPhimMovies
    implements Usecase<List<MovieItemEntity>, GetKhoPhimMoviesParams> {
  final KhoPhimMoviesRepository repository;
  const GetKhoPhimMovies(this.repository);
  @override
  Future<Either<Failure, List<MovieItemEntity>>> call(
    GetKhoPhimMoviesParams params,
  ) async {
    return await repository.getKhoPhimMovies(
      countrySlug: params.countrySlug,
      page: params.page,
      sortField: params.sortField,
      sortType: params.sortType,
      lang: params.lang,
      categorySlug: params.categorySlug,
      year: params.year,
      limit: params.limit,
    );
  }
}

class GetKhoPhimMoviesParams {
  final String countrySlug;
  final int page;
  final String sortField;
  final String sortType;
  final String lang;
  final String categorySlug;
  final String year;
  final int limit;
  const GetKhoPhimMoviesParams({
    required this.countrySlug,
    required this.page,
    required this.sortField,
    required this.sortType,
    required this.lang,
    required this.categorySlug,
    required this.year,
    required this.limit,
  });
}
