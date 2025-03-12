import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/core/error/failure.dart';
import 'package:smoth_movie_app/core/usecase/usecase.dart';
import 'package:smoth_movie_app/features/home/home_search/domain/repository/search_movies_repository.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';

class GetSearchMovies implements Usecase<List<MovieItemEntity>, String> {
  final SearchMoviesRepository searchMoviesRepository;
  const GetSearchMovies({required this.searchMoviesRepository});
  @override
  Future<Either<Failure, List<MovieItemEntity>>> call(params) async {
    return await searchMoviesRepository.getSearchMovies(params);
  }
}
