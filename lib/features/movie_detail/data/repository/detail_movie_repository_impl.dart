import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/core/error/exception.dart';
import 'package:smoth_movie_app/core/error/failure.dart';
import 'package:smoth_movie_app/features/movie_detail/data/model/movie_detail.dart';
import 'package:smoth_movie_app/features/movie_detail/data/source/remote/detail_movie_remote_data_source.dart';
//Repository implemented from domain
import 'package:smoth_movie_app/features/movie_detail/domain/repository/detail_movie_repository.dart';

class DetailMovieRepositoryImpl implements DetailMovieRepository {
  final DetailMovieRemoteDataSource detailMovieRemoteDataSource;
  const DetailMovieRepositoryImpl({required this.detailMovieRemoteDataSource});
  @override
  Future<Either<Failure, MovieDetailModel>> getDetailMovie({
    required String slug,
  }) async {
    try {
      final result = await detailMovieRemoteDataSource.getDetailMovie(
        slug: slug,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
