import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/core/error/failure.dart';
import 'package:smoth_movie_app/features/home/home_search/domain/entities/search_movie_entity.dart';

abstract class SearchMoviesRepository {
  Future<Either<Failure, List<SearchMovieEntity>>> getSearchMovies(
    String query,
  );
}
