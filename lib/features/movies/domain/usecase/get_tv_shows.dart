import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/core/error/failure.dart';
import 'package:smoth_movie_app/core/usecase/usecase.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';
import 'package:smoth_movie_app/features/movies/domain/repository/tv_shows_repository.dart';

class GetTvShows implements UsecaseNoParams<List<MovieItemEntity>> {
  final TvShowsRepository tvShowsRepository;
  const GetTvShows({required this.tvShowsRepository});
  @override
  Future<Either<Failure, List<MovieItemEntity>>> call() async {
    return await tvShowsRepository.getTvShows();
  }
}
