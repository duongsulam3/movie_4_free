import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/core/error/failure.dart';
import 'package:smoth_movie_app/features/nguonc_search_movies/domain/entity/nguonc_movie_item_entity.dart';

abstract interface class NguoncSearchMoviesRepository {
  Future<Either<Failure, List<NguoncMovieItemEntity>>> getSearchFilms({
    required String query,
    required int page,
  });
}
