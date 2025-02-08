import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/core/error/failure.dart';
import 'package:smoth_movie_app/core/usecase/usecase.dart';
import 'package:smoth_movie_app/features/home/home_search/domain/entities/search_movie_entity.dart';
import 'package:smoth_movie_app/features/home/home_search/domain/repository/search_movies_repository.dart';

class GetSearchMovies implements Usecase<List<SearchMovieEntity>, String> {
  final SearchMoviesRepository searchMoviesRepository;
  const GetSearchMovies({required this.searchMoviesRepository});
  @override
  Future<Either<Failure, List<SearchMovieEntity>>> call(params) async {
    return await searchMoviesRepository.getSearchMovies(params);
  }
}
