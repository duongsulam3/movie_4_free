import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/core/error/failure.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';

abstract interface class KhoPhimMoviesRepository {
  Future<Either<Failure, List<MovieItemEntity>>> getKhoPhimMovies({
    required String countrySlug,
    required int page,
    required String sortField,
    required String sortType,
    // String sortField = "_id",
    // String sortType = "asc",
    required String lang,
    required String categorySlug,
    required String year,
    required int limit,
    // int limit = 24,
  });
}
