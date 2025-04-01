import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/core/error/failure.dart';
import 'package:smoth_movie_app/core/usecase/usecase.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';
import 'package:smoth_movie_app/features/movies/domain/repository/movies_sortby_time_repository.dart';

class GetMoviesSortbyTime
    implements Usecase<List<MovieItemEntity>, GetMoviesSortbyTimeParams> {
  final MoviesSortbyTimeRepository repository;
  const GetMoviesSortbyTime(this.repository);
  @override
  Future<Either<Failure, List<MovieItemEntity>>> call(
    GetMoviesSortbyTimeParams params,
  ) async {
    return await repository.getMovies(
      page: params.page,
      limit: params.limit,
      sortfield: params.sortfield,
      cateName: params.cateName,
    );
  }
}

class GetMoviesSortbyTimeParams {
  final int page;
  final int limit;
  final String sortfield;
  final String cateName;
  const GetMoviesSortbyTimeParams({
    required this.page,
    required this.limit,
    required this.sortfield,
    required this.cateName,
  });
}
