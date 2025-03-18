import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/core/error/exception.dart';
import 'package:smoth_movie_app/core/error/failure.dart';
import 'package:smoth_movie_app/features/kho_phim/data/source/remote/kho_phim_movies_remote_data_source.dart';
import 'package:smoth_movie_app/features/kho_phim/domain/repository/kho_phim_movies_repository.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';

class KhoPhimMoviesRepositoryImpl implements KhoPhimMoviesRepository {
  final KhoPhimMoviesRemoteDataSource khoPhimMoviesRemoteDataSource;
  const KhoPhimMoviesRepositoryImpl(this.khoPhimMoviesRemoteDataSource);
  @override
  Future<Either<Failure, List<MovieItemEntity>>> getKhoPhimMovies({
    required String countrySlug,
    required int page,
    required String sortField,
    required String sortType,
    required String lang,
    required String categorySlug,
    required String year,
    required int limit,
  }) async {
    try {
      final res = await khoPhimMoviesRemoteDataSource.getKhoPhimMovies(
        countrySlug: countrySlug,
        page: page,
        sortField: sortField,
        sortType: sortType,
        lang: lang,
        categorySlug: categorySlug,
        year: year,
        limit: limit,
      );
      return Right(res);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
