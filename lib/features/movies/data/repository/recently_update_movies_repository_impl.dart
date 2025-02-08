import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/core/error/exception.dart';
import 'package:smoth_movie_app/core/error/failure.dart';
import 'package:smoth_movie_app/features/movies/data/model/recently_update_movies/recently_update_list_item_model.dart';
import 'package:smoth_movie_app/features/movies/data/source/remote/recently_update_movies_remote_data_source.dart';
//!Repository implemented from domain
import 'package:smoth_movie_app/features/movies/domain/repository/recently_update_movies_repository.dart';

class RecentlyUpdateMoviesRepositoryImpl
    implements RecentlyUpdateMoviesRepository {
  final RecentlyUpdateMoviesRemoteDataSource
      recentlyUpdateMoviesRemoteDataSource;
  const RecentlyUpdateMoviesRepositoryImpl({
    required this.recentlyUpdateMoviesRemoteDataSource,
  });

  @override
  Future<Either<Failure, List<RecentlyUpdateListItemModel>>>
      getRecentlyUpdateMovies() async {
    try {
      final result =
          await recentlyUpdateMoviesRemoteDataSource.getRecentlyUpdateMovies();
      return Right(result);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
