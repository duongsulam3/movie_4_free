import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/core/error/failure.dart';
import 'package:smoth_movie_app/core/usecase/usecase.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/movie_detail.dart';

import 'package:smoth_movie_app/features/movie_detail/domain/repository/detail_movie_repository.dart';

class GetDetailMovie
    implements Usecase<MovieDetailEntity, GetDetailMovieParams> {
  final DetailMovieRepository detailMovieRepository;
  const GetDetailMovie({required this.detailMovieRepository});
  @override
  Future<Either<Failure, MovieDetailEntity>> call(
    GetDetailMovieParams params,
  ) async {
    return await detailMovieRepository.getDetailMovie(slug: params.slug);
  }
}

class GetDetailMovieParams {
  final String slug;
  const GetDetailMovieParams({required this.slug});
}
