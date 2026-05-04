import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/common/error/failure.dart';
import 'package:smoth_movie_app/common/usecase/usecase.dart';
import 'package:smoth_movie_app/features/search/domain/entities/search_suggestion_entity.dart';
import 'package:smoth_movie_app/features/search/domain/repository/search_movies_repository.dart';

class GetSearchSuggestions
    implements Usecase<List<SearchSuggestionEntity>, SearchSuggestionParams> {
  final SearchMoviesRepository searchMoviesRepository;

  const GetSearchSuggestions({required this.searchMoviesRepository});

  @override
  Future<Either<Failure, List<SearchSuggestionEntity>>> call(params) async {
    return await searchMoviesRepository.getSearchSuggestions(
      query: params.query,
      limit: params.limit,
    );
  }
}

class SearchSuggestionParams {
  final String query;
  final int limit;

  const SearchSuggestionParams({
    required this.query,
    required this.limit,
  });
}
