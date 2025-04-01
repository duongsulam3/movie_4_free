import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/core/error/exception.dart';
import 'package:smoth_movie_app/core/error/failure.dart';
import 'package:smoth_movie_app/features/movies/data/source/remote/movies_sortby_modified_time_remote_data_source.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';
import 'package:smoth_movie_app/features/movies/domain/repository/movies_sortby_time_repository.dart';

class MoviesSortbyTimeRepositoryImpl implements MoviesSortbyTimeRepository {
  final MoviesSortbyModifiedTimeRemoteDataSource source;
  const MoviesSortbyTimeRepositoryImpl(this.source);
  @override
  Future<Either<Failure, List<MovieItemEntity>>> getMovies({
    required int page,
    required int limit,
    required String sortfield,
    required String cateName,
  }) async {
    try {
      final res = await source.getMovies(
        page: page,
        limit: limit,
        sortfield: sortfield,
        cateName: cateName,
      );
      return Right(res);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
