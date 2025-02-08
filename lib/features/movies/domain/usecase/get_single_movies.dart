import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/core/error/failure.dart';
import 'package:smoth_movie_app/core/usecase/usecase.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';
import 'package:smoth_movie_app/features/movies/domain/repository/single_movies_repository.dart';

class GetSingleMovies implements UsecaseNoParams<List<MovieItemEntity>> {
  final SingleMoviesRepository singleMoviesRepository;
  const GetSingleMovies({required this.singleMoviesRepository});
  @override
  Future<Either<Failure, List<MovieItemEntity>>> call() async {
    return await singleMoviesRepository.getSingleMovies();
  }
}
