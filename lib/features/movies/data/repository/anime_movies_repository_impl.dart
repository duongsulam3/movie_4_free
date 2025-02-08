import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/core/error/exception.dart';
import 'package:smoth_movie_app/core/error/failure.dart';
import 'package:smoth_movie_app/features/movies/data/model/single_movies/single_movie_item.dart';
import 'package:smoth_movie_app/features/movies/data/source/remote/anime_movies_remote_data_source.dart';

import 'package:smoth_movie_app/features/movies/domain/repository/anime_movies_repository.dart';

class AnimeMoviesRepositoryImpl implements AnimeMoviesRepository {
  final AnimeMoviesRemoteDataSource animeMoviesRemoteDataSource;
  const AnimeMoviesRepositoryImpl({required this.animeMoviesRemoteDataSource});
  @override
  Future<Either<Failure, List<MovieItemModel>>> getAnimeMovies() async {
    try {
      final result = await animeMoviesRemoteDataSource.getAnimeMovies();
      return Right(result);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
