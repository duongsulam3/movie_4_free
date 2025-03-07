import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/core/error/failure.dart';
import 'package:smoth_movie_app/core/usecase/usecase.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';
import 'package:smoth_movie_app/features/movies/domain/repository/movies_repository.dart';

class GetMovies implements Usecase<List<MovieItemEntity>, GetMoviesParams> {
  final MoviesRepository moviesRepository;
  const GetMovies({required this.moviesRepository});
  @override
  Future<Either<Failure, List<MovieItemEntity>>> call(
    GetMoviesParams params,
  ) async {
    return await moviesRepository.getMovies(
      page: params.page,
      limit: params.limit,
      cateName: params.cateName,
    );
  }
}

class GetMoviesParams {
  final int page;
  final int limit;
  final String cateName;
  const GetMoviesParams({
    required this.page,
    required this.cateName,
    required this.limit,
  });
}
