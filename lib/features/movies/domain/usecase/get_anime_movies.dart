import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/core/error/failure.dart';
import 'package:smoth_movie_app/core/usecase/usecase.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';
import 'package:smoth_movie_app/features/movies/domain/repository/anime_movies_repository.dart';

class GetAnimeMovies implements UsecaseNoParams<List<MovieItemEntity>> {
  final AnimeMoviesRepository animeMoviesRepository;
  const GetAnimeMovies({required this.animeMoviesRepository});
  @override
  Future<Either<Failure, List<MovieItemEntity>>> call() async {
    return await animeMoviesRepository.getAnimeMovies();
  }
}
