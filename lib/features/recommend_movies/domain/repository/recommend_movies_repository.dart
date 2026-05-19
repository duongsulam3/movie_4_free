import 'package:dartz/dartz.dart';

import '../../../../common/error/failure.dart';
import '../entities/recommend_movie.dart';

abstract interface class RecommendMoviesRepository {
  Future<Either<Failure, List<RecommendMovieEntity>>> getRecommendMovies();
}
