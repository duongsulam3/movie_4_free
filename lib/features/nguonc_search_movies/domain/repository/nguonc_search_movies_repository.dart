import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/common/error/failure.dart';
import 'package:smoth_movie_app/features/nguonc_search_movies/domain/entity/nguonc_movie_item_entity.dart';
import 'package:smoth_movie_app/features/nguonc_search_movies/domain/entity/nguonc_search_suggestion_entity.dart';

abstract interface class NguoncSearchMoviesRepository {
  Future<Either<Failure, List<NguoncMovieItemEntity>>> getSearchFilms({
    required String query,
    required int page,
  });

  Future<Either<Failure, List<NguoncSearchSuggestionEntity>>>
      getSearchSuggestions({
    required String query,
    required int limit,
  });
}
