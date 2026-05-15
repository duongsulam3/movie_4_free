import 'package:dartz/dartz.dart';

import '../../../../common/error/exception.dart';
import '../../../../common/error/failure.dart';
import '../../domain/entities/recommend_movie.dart';
import '../../domain/repository/recommend_movies_repository.dart';
import '../source/remote/recommend_movies_remote_data_source.dart';

class RecommendMoviesRepositoryImpl implements RecommendMoviesRepository {
  final RecommendMoviesRemoteDataSource remoteDataSource;
  const RecommendMoviesRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<RecommendMovieEntity>>>
      getRecommendMovies() async {
    try {
      final res = await remoteDataSource.getRecommendMovies();
      return Right(res);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
