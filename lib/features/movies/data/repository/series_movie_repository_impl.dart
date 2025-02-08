import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/core/error/exception.dart';
import 'package:smoth_movie_app/core/error/failure.dart';
import 'package:smoth_movie_app/features/movies/data/model/single_movies/single_movie_item.dart';
import 'package:smoth_movie_app/features/movies/data/source/remote/series_movie_remote_data_source.dart';
import 'package:smoth_movie_app/features/movies/domain/repository/series_movie_repository.dart';

class SeriesMovieRepositoryImpl implements SeriesMovieRepository {
  final SeriesMovieRemoteDataSource seriesMovieRemoteDataSource;
  const SeriesMovieRepositoryImpl({required this.seriesMovieRemoteDataSource});
  @override
  Future<Either<Failure, List<MovieItemModel>>> getSeriesMovie() async {
    try {
      final result = await seriesMovieRemoteDataSource.getSeriesMovies();
      return Right(result);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
