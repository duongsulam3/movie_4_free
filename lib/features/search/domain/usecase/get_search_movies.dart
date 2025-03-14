import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/core/error/failure.dart';
import 'package:smoth_movie_app/core/usecase/usecase.dart';
import 'package:smoth_movie_app/features/search/domain/repository/search_movies_repository.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';

class GetSearchMovies implements Usecase<List<MovieItemEntity>, SearchParams> {
  final SearchMoviesRepository searchMoviesRepository;
  const GetSearchMovies({required this.searchMoviesRepository});
  @override
  Future<Either<Failure, List<MovieItemEntity>>> call(params) async {
    return await searchMoviesRepository.getSearchMovies(
      query: params.query,
      page: params.page,
      limit: params.limit,
    );
  }
}

class SearchParams {
  final String query;
  final int page;
  final int limit;
  const SearchParams({
    required this.query,
    required this.page,
    required this.limit,
  });
}
