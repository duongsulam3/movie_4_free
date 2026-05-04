import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/common/error/failure.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';
import 'package:smoth_movie_app/features/search/domain/entities/search_suggestion_entity.dart';

abstract class SearchMoviesRepository {
  Future<Either<Failure, List<MovieItemEntity>>> getSearchMovies({
    required String query,
    required int page,
    required int limit,
  });

  Future<Either<Failure, List<SearchSuggestionEntity>>> getSearchSuggestions({
    required String query,
    required int limit,
  });
}
