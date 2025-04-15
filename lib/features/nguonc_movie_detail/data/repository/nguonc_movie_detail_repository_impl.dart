import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/core/error/exception.dart';
import 'package:smoth_movie_app/core/error/failure.dart';
import 'package:smoth_movie_app/features/nguonc_movie_detail/data/model/nguonc_movie_model.dart';
import 'package:smoth_movie_app/features/nguonc_movie_detail/data/source/remote/nguonc_movide_detail_remote_datasource.dart';
import 'package:smoth_movie_app/features/nguonc_movie_detail/domain/repository/nguonc_movie_detail_repository.dart';

class NguoncMovieDetailRepositoryImpl implements NguoncMovieDetailRepository {
  final NguoncMovieDetailRemoteDatasource source;
  const NguoncMovieDetailRepositoryImpl(this.source);
  @override
  Future<Either<Failure, NguoncMovieModel>> getDetailMovie({
    required String slug,
  }) async {
    try {
      final res = await source.getNguoncMovieDetail(slug: slug);
      return Right(res);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
