import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/core/error/failure.dart';
import 'package:smoth_movie_app/core/usecase/usecase.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';
import 'package:smoth_movie_app/features/movies/domain/repository/series_movie_repository.dart';

class GetSeriesMovies implements UsecaseNoParams<List<MovieItemEntity>> {
  final SeriesMovieRepository seriesMovieRepository;
  const GetSeriesMovies({required this.seriesMovieRepository});
  @override
  Future<Either<Failure, List<MovieItemEntity>>> call() async {
    return await seriesMovieRepository.getSeriesMovie();
  }
}
