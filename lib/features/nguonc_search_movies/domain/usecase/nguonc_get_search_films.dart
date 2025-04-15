import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/core/error/failure.dart';
import 'package:smoth_movie_app/core/usecase/usecase.dart';
import 'package:smoth_movie_app/features/nguonc_search_movies/domain/entity/nguonc_movie_item_entity.dart';
import 'package:smoth_movie_app/features/nguonc_search_movies/domain/repository/nguonc_search_movies_repository.dart';

class NguoncGetSearchFilms
    implements
        Usecase<List<NguoncMovieItemEntity>, NguoncGetSearchFilmsParams> {
  final NguoncSearchMoviesRepository repository;
  const NguoncGetSearchFilms(this.repository);
  @override
  Future<Either<Failure, List<NguoncMovieItemEntity>>> call(
    NguoncGetSearchFilmsParams params,
  ) async {
    return await repository.getSearchFilms(
      query: params.query,
      page: params.page,
    );
  }
}

class NguoncGetSearchFilmsParams {
  final String query;
  final int page;
  const NguoncGetSearchFilmsParams({
    required this.query,
    required this.page,
  });
}
