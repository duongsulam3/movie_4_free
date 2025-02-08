import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/core/error/failure.dart';
import 'package:smoth_movie_app/core/usecase/usecase.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/currently_update_movies/recently_update_list_item.dart';
import 'package:smoth_movie_app/features/movies/domain/repository/recently_update_movies_repository.dart';

class GetRecentlyMovies
    implements
        Usecase<List<RecentlyUpdateListItemEntity>, GetRecentlyMoviesParams> {
  final RecentlyUpdateMoviesRepository recentlyUpdateMoviesRepository;
  const GetRecentlyMovies({required this.recentlyUpdateMoviesRepository});

  @override
  Future<Either<Failure, List<RecentlyUpdateListItemEntity>>> call(
    GetRecentlyMoviesParams params,
  ) async {
    return await recentlyUpdateMoviesRepository.getRecentlyUpdateMovies();
  }
}

class GetRecentlyMoviesParams {
  const GetRecentlyMoviesParams();
}
