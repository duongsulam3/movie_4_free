import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/core/error/failure.dart';
import 'package:smoth_movie_app/core/usecase/usecase.dart';
import 'package:smoth_movie_app/features/nguonc_movie_detail/domain/entity/nguonc_movie_entity.dart';
import 'package:smoth_movie_app/features/nguonc_movie_detail/domain/repository/nguonc_movie_detail_repository.dart';

class GetNguoncMovieDetail
    implements Usecase<NguoncMovieEntity, GetNguoncMovieDetailParams> {
  final NguoncMovieDetailRepository repository;
  const GetNguoncMovieDetail(this.repository);
  @override
  Future<Either<Failure, NguoncMovieEntity>> call(
    GetNguoncMovieDetailParams params,
  ) async {
    return await repository.getDetailMovie(slug: params.slug);
  }
}

class GetNguoncMovieDetailParams {
  final String slug;
  const GetNguoncMovieDetailParams({required this.slug});
}
