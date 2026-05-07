import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/common/error/failure.dart';
import 'package:smoth_movie_app/common/usecase/usecase.dart';
import 'package:smoth_movie_app/features/nguonc_search_movies/domain/entity/nguonc_search_suggestion_entity.dart';
import 'package:smoth_movie_app/features/nguonc_search_movies/domain/repository/nguonc_search_movies_repository.dart';

class NguoncGetSearchSuggestions
    implements
        Usecase<List<NguoncSearchSuggestionEntity>,
            NguoncSearchSuggestionParams> {
  final NguoncSearchMoviesRepository repository;
  const NguoncGetSearchSuggestions(this.repository);

  @override
  Future<Either<Failure, List<NguoncSearchSuggestionEntity>>> call(
    NguoncSearchSuggestionParams params,
  ) async {
    return await repository.getSearchSuggestions(
      query: params.query,
      limit: params.limit,
    );
  }
}

class NguoncSearchSuggestionParams {
  final String query;
  final int limit;
  const NguoncSearchSuggestionParams({
    required this.query,
    required this.limit,
  });
}
