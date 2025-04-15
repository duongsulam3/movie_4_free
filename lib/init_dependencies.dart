import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:smoth_movie_app/features/kho_phim/data/repository/categories_repository_impl.dart';
import 'package:smoth_movie_app/features/kho_phim/data/repository/countries_repository_impl.dart';
import 'package:smoth_movie_app/features/kho_phim/data/repository/kho_phim_movies_repository_impl.dart';
import 'package:smoth_movie_app/features/kho_phim/data/source/remote/categories_remote_data_source.dart';
import 'package:smoth_movie_app/features/kho_phim/data/source/remote/countries_remote_data_source.dart';
import 'package:smoth_movie_app/features/kho_phim/data/source/remote/kho_phim_movies_remote_data_source.dart';
import 'package:smoth_movie_app/features/kho_phim/domain/repository/categories_repository.dart';
import 'package:smoth_movie_app/features/kho_phim/domain/repository/countries_repository.dart';
import 'package:smoth_movie_app/features/kho_phim/domain/repository/kho_phim_movies_repository.dart';
import 'package:smoth_movie_app/features/kho_phim/domain/usecase/get_categories.dart';
import 'package:smoth_movie_app/features/kho_phim/domain/usecase/get_countries.dart';
import 'package:smoth_movie_app/features/kho_phim/domain/usecase/get_kho_phim_movies.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/bloc/categories/category_list_bloc.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/bloc/countries/countries_bloc.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/bloc/kho_phim_movies/kho_phim_movies_bloc.dart';
import 'package:smoth_movie_app/features/movies/data/repository/movies_sortby_time_repository_impl.dart';
import 'package:smoth_movie_app/features/movies/data/repository/similar_repository_impl.dart';
import 'package:smoth_movie_app/features/movies/data/source/remote/movies_sortby_modified_time_remote_data_source.dart';
import 'package:smoth_movie_app/features/movies/data/source/remote/similar_movies_remote_data_source.dart';
import 'package:smoth_movie_app/features/movies/domain/repository/movies_sortby_time_repository.dart';
import 'package:smoth_movie_app/features/movies/domain/repository/similar_movies_repository.dart';
import 'package:smoth_movie_app/features/movies/domain/usecase/get_movies_sortby_time.dart';
import 'package:smoth_movie_app/features/movies/domain/usecase/get_similar_movies.dart';
import 'package:smoth_movie_app/features/movies/presentation/bloc/movies_sortby_time/movies_sort_by_time_bloc.dart';
import 'package:smoth_movie_app/features/movies/presentation/bloc/similar_movies/similar_movies_bloc.dart';
import 'package:smoth_movie_app/features/nguonc_search_movies/data/repository/nguonc_search_movies_repository_impl.dart';
import 'package:smoth_movie_app/features/nguonc_search_movies/data/source/remote/search_movies_remote_data_source.dart';
import 'package:smoth_movie_app/features/nguonc_search_movies/domain/repository/nguonc_search_movies_repository.dart';
import 'package:smoth_movie_app/features/nguonc_search_movies/domain/usecase/nguonc_get_search_films.dart';
import 'package:smoth_movie_app/features/nguonc_search_movies/presentation/bloc/nguonc_search_bloc.dart';
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
import 'package:smoth_movie_app/features/movie_detail/presentation/bloc/detail_movie/detail_movie_bloc.dart';
import 'package:smoth_movie_app/features/movies/presentation/bloc/movies/movies_bloc.dart';
import 'package:smoth_movie_app/features/movies/presentation/bloc/recently_update_movies/recently_update_movies_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  serviceLocator.registerLazySingleton(() => http.Client());
  _initListMovies();
  _initDetailMovie();
  _initSearch();
  _initKhoPhimFeature();
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
    () => MoviesBloc(usecase: serviceLocator()),
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
    () => RecentlyUpdateMoviesBloc(serviceLocator()),
  );
  //** Recently Update Movies */

  //** Similar Movies */
  serviceLocator.registerFactory<SimilarMoviesRemoteDataSource>(
    () => SimilarMoviesRemoteDataSourceImpl(serviceLocator()),
  );
  serviceLocator.registerFactory<SimilarMoviesRepository>(
    () => SimilarRepositoryImpl(serviceLocator()),
  );
  serviceLocator.registerFactory(() => GetSimilarMovies(serviceLocator()));
  serviceLocator.registerFactory(() => SimilarMoviesBloc(serviceLocator()));
  //** Similar Movies */

  //** Movies Sort By Time */
  serviceLocator.registerFactory<MoviesSortbyModifiedTimeRemoteDataSource>(
    () => MoviesSortbyModifiedTimeRemoteDataSourceImpl(
      client: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory<MoviesSortbyTimeRepository>(
    () => MoviesSortbyTimeRepositoryImpl(serviceLocator()),
  );
  serviceLocator.registerFactory(() => GetMoviesSortbyTime(serviceLocator()));
  serviceLocator.registerFactory(() => MoviesSortByTimeBloc(serviceLocator()));
  //** Movies Sort By Time */
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
  //** KK Phim Search */
  serviceLocator.registerFactory<SearchMovieRemoteDataSource>(
    () => SearchMovieRemoteDatasourceImpl(client: serviceLocator()),
  );
  serviceLocator.registerFactory<SearchMoviesRepository>(
    () => SearchMoviesRepositoryImpl(remoteDatasource: serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => GetSearchMovies(searchMoviesRepository: serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => SearchBloc(getSearchMovies: serviceLocator<GetSearchMovies>()),
  );
  //** KK Phim Search */

  //** Nguồn C Search */
  serviceLocator.registerFactory<NguonCSearchMoviesRemoteDataSource>(
    () => NguonCSearchMoviesRemoteDataSourceImpl(serviceLocator()),
  );
  serviceLocator.registerFactory<NguoncSearchMoviesRepository>(
    () => NguoncSearchMoviesRepositoryImpl(serviceLocator()),
  );
  serviceLocator.registerFactory(() => NguoncGetSearchFilms(serviceLocator()));
  serviceLocator.registerFactory(() => NguoncSearchBloc(serviceLocator()));
  //** Nguồn C Search */
}

void _initKhoPhimFeature() {
  //** Categories */
  serviceLocator.registerFactory<CategoriesRemoteDataSource>(
    () => CategoriesRemoteDataSourceImpl(client: serviceLocator()),
  );
  serviceLocator.registerFactory<CategoriesRepository>(
    () => CategoriesRepositoryImpl(serviceLocator()),
  );
  serviceLocator.registerFactory(() => GetCategories(serviceLocator()));
  serviceLocator.registerFactory(() => CategoryListBloc(serviceLocator()));
  //** Categories */

  //** Countries */
  serviceLocator.registerFactory<CountriesRemoteDataSource>(
    () => CountriesRemoteDataSourceImpl(client: serviceLocator()),
  );
  serviceLocator.registerFactory<CountriesRepository>(
    () => CountriesRepositoryImpl(serviceLocator()),
  );
  serviceLocator.registerFactory(() => GetCountries(serviceLocator()));
  serviceLocator.registerFactory(() => CountriesBloc(serviceLocator()));
  //** Countries */

  //** Kho Phim Movies */
  serviceLocator.registerFactory<KhoPhimMoviesRemoteDataSource>(
    () => KhoPhimMoviesRemoteDataSourceImpl(serviceLocator()),
  );
  serviceLocator.registerFactory<KhoPhimMoviesRepository>(
    () => KhoPhimMoviesRepositoryImpl(serviceLocator()),
  );
  serviceLocator.registerFactory(() => GetKhoPhimMovies(serviceLocator()));
  serviceLocator.registerFactory(() => KhoPhimMoviesBloc(serviceLocator()));
  //** Kho Phim Movies */
}
