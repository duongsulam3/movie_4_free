import 'package:dartz/dartz.dart';

import '../../../../common/error/failure.dart';
import '../../../../common/usecase/usecase.dart';
import '../entities/recommend_movie.dart';
import '../repository/recommend_movies_repository.dart';

class GetRecommendMovies
    implements UsecaseNoParams<List<RecommendMovieEntity>> {
  final RecommendMoviesRepository repository;
  const GetRecommendMovies({required this.repository});

  @override
  Future<Either<Failure, List<RecommendMovieEntity>>> call() async {
    return await repository.getRecommendMovies();
  }
}
