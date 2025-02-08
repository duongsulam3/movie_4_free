import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/core/error/exception.dart';
import 'package:smoth_movie_app/core/error/failure.dart';
import 'package:smoth_movie_app/features/movies/data/source/remote/tv_show_remote_data_source.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';
import 'package:smoth_movie_app/features/movies/domain/repository/tv_shows_repository.dart';

class TvShowsRepositoryImpl implements TvShowsRepository {
  final TvShowRemoteDataSource tvShowRemoteDataSource;
  const TvShowsRepositoryImpl({required this.tvShowRemoteDataSource});

  @override
  Future<Either<Failure, List<MovieItemEntity>>> getTvShows() async {
    try {
      final result = await tvShowRemoteDataSource.getTvShows();
      return Right(result);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
