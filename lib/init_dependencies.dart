import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:smoth_movie_app/features/search/data/repository/search_movies_repository_impl.dart';
import 'package:smoth_movie_app/features/search/data/source/remote/search_movie_remote_datasource.dart';
import 'package:smoth_movie_app/features/search/domain/repository/search_movies_repository.dart';
import 'package:smoth_movie_app/features/search/domain/usecase/get_search_movies.dart';
import 'package:smoth_movie_app/features/search/presentation/bloc/search_bloc.dart';
import 'package:smoth_movie_app/features/movie_detail/data/repository/detail_movie_repository_impl.dart';
import 'package:smoth_movie_app/features/movie_detail/data/source/remote/detail_movie_remote_data_source.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/repository/detail_movie_repository.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/usecase/get_detail_movie.dart';
import 'package:smoth_movie_app/features/movies/data/repository/movies_repository_impl.dart';
import 'package:smoth_movie_app/features/movies/data/repository/recently_update_movies_repository_impl.dart';
import 'package:smoth_movie_app/features/movies/data/source/remote/movies_remote_data_source.dart';
import 'package:smoth_movie_app/features/movies/data/source/remote/recently_update_movies_remote_data_source.dart';
import 'package:smoth_movie_app/features/movies/domain/repository/movies_repository.dart';
import 'package:smoth_movie_app/features/movies/domain/repository/recently_update_movies_repository.dart';
import 'package:smoth_movie_app/features/movies/domain/usecase/get_movies.dart';
import 'package:smoth_movie_app/features/movies/domain/usecase/get_recently_movies.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/blocs/detail_movie_bloc/detail_movie_bloc.dart';
import 'package:smoth_movie_app/features/movies/presentation/bloc/movies_bloc/movies_bloc.dart';
import 'package:smoth_movie_app/features/movies/presentation/bloc/recently_update_movies/recently_update_movies_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  serviceLocator.registerLazySingleton(() => http.Client());
  _initListMovies();
  _initDetailMovie();
  _initSearch();
}

void _initListMovies() {
  //** Movies */
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
  //** Movies */

  //** Recently Update Movies */ 
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
  serviceLocator.registerFactory(
    () => RecentlyUpdateMoviesBloc(serviceLocator<GetRecentlyMovies>()),
  );
  //** Recently Update Movies */ 
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
