import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/core/error/exception.dart';
import 'package:smoth_movie_app/core/error/failure.dart';
import 'package:smoth_movie_app/features/nguonc_search_movies/data/model/nguonc_movie_item_model.dart';
import 'package:smoth_movie_app/features/nguonc_search_movies/data/source/remote/search_movies_remote_data_source.dart';
import 'package:smoth_movie_app/features/nguonc_search_movies/domain/repository/nguonc_search_movies_repository.dart';

class NguoncSearchMoviesRepositoryImpl implements NguoncSearchMoviesRepository {
  final NguonCSearchMoviesRemoteDataSource source;
  const NguoncSearchMoviesRepositoryImpl(this.source);
  @override
  Future<Either<Failure, List<NguoncMovieItemModel>>> getSearchFilms({
    required String query,
    required int page,
  }) async {
    try {
      final res = await source.searchFilms(query: query, page: page);
      return Right(res);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
