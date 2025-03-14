import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/core/error/exception.dart';
import 'package:smoth_movie_app/core/error/failure.dart';
import 'package:smoth_movie_app/features/search/data/source/remote/search_movie_remote_datasource.dart';
import 'package:smoth_movie_app/features/search/domain/repository/search_movies_repository.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';

class SearchMoviesRepositoryImpl implements SearchMoviesRepository {
  final SearchMovieRemoteDataSource remoteDatasource;
  const SearchMoviesRepositoryImpl({required this.remoteDatasource});
  @override
  Future<Either<Failure, List<MovieItemEntity>>> getSearchMovies({
    required String query,
    required int page,
    required int limit,
  }) async {
    try {
      final result = await remoteDatasource.getSearchMovies(
        query: query,
        page: page,
        limit: limit,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
