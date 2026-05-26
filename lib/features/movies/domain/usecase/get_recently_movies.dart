import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/common/error/failure.dart';
import 'package:smoth_movie_app/common/usecase/usecase.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/currently_update_movies/recently_update_list_item.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/currently_update_movies/recently_update_movies_fetch_result.dart';
import 'package:smoth_movie_app/features/movies/domain/repository/recently_update_movies_repository.dart';

class GetRecentlyMovies
    implements
        Usecase<RecentlyUpdateMoviesFetchResult, GetRecentlyMoviesParams> {
  final RecentlyUpdateMoviesRepository recentlyUpdateMoviesRepository;
  const GetRecentlyMovies({required this.recentlyUpdateMoviesRepository});

  Future<List<RecentlyUpdateListItemEntity>> getCachedRecentlyMovies() {
    return recentlyUpdateMoviesRepository.getCachedRecentlyUpdateMovies();
  }

  @override
  Future<Either<Failure, RecentlyUpdateMoviesFetchResult>> call(
    GetRecentlyMoviesParams params,
  ) async {
    return await recentlyUpdateMoviesRepository.getRecentlyUpdateMovies();
  }
}

class GetRecentlyMoviesParams {
  const GetRecentlyMoviesParams();
}
