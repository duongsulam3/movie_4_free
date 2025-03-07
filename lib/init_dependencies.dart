import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:smoth_movie_app/features/home/home_search/data/repository/search_movies_repository_impl.dart';
import 'package:smoth_movie_app/features/home/home_search/data/source/remote/search_movie_remote_datasource.dart';
import 'package:smoth_movie_app/features/home/home_search/domain/repository/search_movies_repository.dart';
import 'package:smoth_movie_app/features/home/home_search/domain/usecase/get_search_movies.dart';
import 'package:smoth_movie_app/features/home/home_search/presentation/bloc/search_bloc.dart';
import 'package:smoth_movie_app/features/movie_detail/data/repository/detail_movie_repository_impl.dart';
import 'package:smoth_movie_app/features/movie_detail/data/source/remote/detail_movie_remote_data_source.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/repository/detail_movie_repository.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/usecase/get_detail_movie.dart';
import 'package:smoth_movie_app/features/movies/data/repository/anime_movies_repository_impl.dart';
import 'package:smoth_movie_app/features/movies/data/repository/movies_repository_impl.dart';
import 'package:smoth_movie_app/features/movies/data/repository/recently_update_movies_repository_impl.dart';
import 'package:smoth_movie_app/features/movies/data/repository/series_movie_repository_impl.dart';
import 'package:smoth_movie_app/features/movies/data/repository/single_movies_repository_impl.dart';
import 'package:smoth_movie_app/features/movies/data/repository/tv_shows_repository_impl.dart';
import 'package:smoth_movie_app/features/movies/data/source/remote/anime_movies_remote_data_source.dart';
import 'package:smoth_movie_app/features/movies/data/source/remote/movies_remote_data_source.dart';
import 'package:smoth_movie_app/features/movies/data/source/remote/recently_update_movies_remote_data_source.dart';
import 'package:smoth_movie_app/features/movies/data/source/remote/series_movie_remote_data_source.dart';
import 'package:smoth_movie_app/features/movies/data/source/remote/single_movie_remote_data_source.dart';
import 'package:smoth_movie_app/features/movies/data/source/remote/tv_show_remote_data_source.dart';
import 'package:smoth_movie_app/features/movies/domain/repository/anime_movies_repository.dart';
import 'package:smoth_movie_app/features/movies/domain/repository/movies_repository.dart';
import 'package:smoth_movie_app/features/movies/domain/repository/recently_update_movies_repository.dart';
import 'package:smoth_movie_app/features/movies/domain/repository/series_movie_repository.dart';
import 'package:smoth_movie_app/features/movies/domain/repository/single_movies_repository.dart';
import 'package:smoth_movie_app/features/movies/domain/repository/tv_shows_repository.dart';
import 'package:smoth_movie_app/features/movies/domain/usecase/get_anime_movies.dart';
import 'package:smoth_movie_app/features/movies/domain/usecase/get_movies.dart';
import 'package:smoth_movie_app/features/movies/domain/usecase/get_recently_movies.dart';
import 'package:smoth_movie_app/features/movies/domain/usecase/get_series_movies.dart';
import 'package:smoth_movie_app/features/movies/domain/usecase/get_single_movies.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/blocs/detail_movie_bloc/detail_movie_bloc.dart';
import 'package:smoth_movie_app/features/movies/domain/usecase/get_tv_shows.dart';
import 'package:smoth_movie_app/features/movies/presentation/bloc/list_movie_item_bloc/list_movie_item_bloc.dart';
import 'package:smoth_movie_app/features/movies/presentation/bloc/movies_bloc/movies_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  serviceLocator.registerLazySingleton(() => http.Client());
  _initListMovies();
  _initDetailMovie();
  _initSearch();
}

void _initListMovies() {
  //* Movies
  serviceLocator.registerFactory<MoviesRemoteDataSource>(
    () => MoviesRemoteDataSourceImpl(client: serviceLocator()),
  );
  //
  serviceLocator.registerFactory<MoviesRepository>(
    () => MoviesRepositoryImpl(moviesRemoteDataSource: serviceLocator()),
  );
  //
  serviceLocator.registerFactory(
    () => GetMovies(moviesRepository: serviceLocator()),
  );

  serviceLocator.registerFactory(
    () => MoviesBloc(getMovies: serviceLocator<GetMovies>()),
  );
  
  //* Recently Update Movies
  serviceLocator.registerFactory<RecentlyUpdateMoviesRemoteDataSource>(
    () => RecentlyUpdateMoviesRemoteDataSourceImpl(
      client: serviceLocator(),
    ),
  );
  //
  serviceLocator.registerFactory<RecentlyUpdateMoviesRepository>(
    () => RecentlyUpdateMoviesRepositoryImpl(
      recentlyUpdateMoviesRemoteDataSource: serviceLocator(),
    ),
  );
  //
  serviceLocator.registerFactory(
    () => GetRecentlyMovies(
      recentlyUpdateMoviesRepository: serviceLocator(),
    ),
  );
  //* Anime Movies
  serviceLocator.registerFactory<AnimeMoviesRemoteDataSource>(
    () => AnimeMoviesRemoteDataSourceImpl(
      client: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory<AnimeMoviesRepository>(
    () => AnimeMoviesRepositoryImpl(
      animeMoviesRemoteDataSource: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => GetAnimeMovies(
      animeMoviesRepository: serviceLocator(),
    ),
  );
  //* Single Movie
  serviceLocator.registerFactory<SingleMovieRemoteDataSource>(
    () => SingleMovieRemoteDataSourceImpl(
      client: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory<SingleMoviesRepository>(
    () => SingleMoviesRepositoryImpl(
      singleMovieRemoteDataSource: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => GetSingleMovies(
      singleMoviesRepository: serviceLocator(),
    ),
  );
  //*Tv Show
  serviceLocator.registerFactory<TvShowRemoteDataSource>(
    () => TvShowRemoteDataSourceImpl(
      client: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory<TvShowsRepository>(
    () => TvShowsRepositoryImpl(
      tvShowRemoteDataSource: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => GetTvShows(
      tvShowsRepository: serviceLocator(),
    ),
  );
  //*Series Movie
  serviceLocator.registerFactory<SeriesMovieRemoteDataSource>(
    () => SeriesMovieRemoteDataSourceImpl(
      client: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory<SeriesMovieRepository>(
    () => SeriesMovieRepositoryImpl(
      seriesMovieRemoteDataSource: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => GetSeriesMovies(
      seriesMovieRepository: serviceLocator(),
    ),
  );

  //* List Movies Bloc
  serviceLocator.registerFactory(
    () => ListMovieItemBloc(
      getRecentlyMovies: serviceLocator<GetRecentlyMovies>(),
      getAnimeMovies: serviceLocator<GetAnimeMovies>(),
      getSingleMovies: serviceLocator<GetSingleMovies>(),
      getTvShows: serviceLocator<GetTvShows>(),
      getSeriesMovies: serviceLocator<GetSeriesMovies>(),
    ),
  );
}

void _initDetailMovie() {
  serviceLocator.registerFactory<DetailMovieRemoteDataSource>(
    () => DetailMovieRemoteDataSourceImpl(
      client: serviceLocator(),
    ),
  );
  //
  serviceLocator.registerFactory<DetailMovieRepository>(
    () => DetailMovieRepositoryImpl(
      detailMovieRemoteDataSource: serviceLocator(),
    ),
  );
  //
  serviceLocator.registerFactory(
    () => GetDetailMovie(
      detailMovieRepository: serviceLocator(),
    ),
  );
  //
  serviceLocator.registerFactory(
    () => DetailMovieBloc(
      getDetailMovie: serviceLocator<GetDetailMovie>(),
    ),
  );
}

void _initSearch() {
  serviceLocator.registerFactory<SearchMovieRemoteDataSource>(
    () => SearchMovieRemoteDatasourceImpl(
      client: serviceLocator(),
    ),
  );
  //
  serviceLocator.registerFactory<SearchMoviesRepository>(
    () => SearchMoviesRepositoryImpl(
      remoteDatasource: serviceLocator(),
    ),
  );
  //
  serviceLocator.registerFactory(
    () => GetSearchMovies(
      searchMoviesRepository: serviceLocator(),
    ),
  );
  //
  serviceLocator.registerFactory(
    () => SearchBloc(
      getSearchMovies: serviceLocator<GetSearchMovies>(),
    ),
  );
}
