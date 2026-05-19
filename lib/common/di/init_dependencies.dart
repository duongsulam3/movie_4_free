import 'package:get_it/get_it.dart';
import 'package:smoth_movie_app/common/local/hive_manager.dart';
import 'package:smoth_movie_app/common/utils/network/app_service.dart';
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
import 'package:smoth_movie_app/features/search/data/repository/search_history_repository_impl.dart';
import 'package:smoth_movie_app/features/search/data/repository/search_movies_repository_impl.dart';
import 'package:smoth_movie_app/features/search/data/source/local/search_history_local_data_source.dart';
import 'package:smoth_movie_app/features/search/data/source/remote/search_movie_remote_datasource.dart';
import 'package:smoth_movie_app/features/search/domain/repository/search_history_repository.dart';
import 'package:smoth_movie_app/features/search/domain/repository/search_movies_repository.dart';
import 'package:smoth_movie_app/features/search/domain/usecase/clear_search_history.dart';
import 'package:smoth_movie_app/features/search/domain/usecase/delete_search_keyword.dart';
import 'package:smoth_movie_app/features/search/domain/usecase/get_search_history.dart';
import 'package:smoth_movie_app/features/search/domain/usecase/get_search_movies.dart';
import 'package:smoth_movie_app/features/search/domain/usecase/get_search_suggestions.dart';
import 'package:smoth_movie_app/features/search/domain/usecase/save_search_keyword.dart';
import 'package:smoth_movie_app/features/search/presentation/bloc/search_bloc.dart';
import 'package:smoth_movie_app/features/search/presentation/cubit/search_history_cubit.dart';
import 'package:smoth_movie_app/features/movie_detail/data/repository/detail_movie_repository_impl.dart';
import 'package:smoth_movie_app/features/movie_detail/data/source/remote/detail_movie_remote_data_source.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/repository/detail_movie_repository.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/usecase/get_detail_movie.dart';
import 'package:smoth_movie_app/features/movies/data/repository/movies_repository_impl.dart';
import 'package:smoth_movie_app/features/movies/data/repository/recently_update_movies_repository_impl.dart';
import 'package:smoth_movie_app/features/movies/data/source/local/home_movies_local_data_source.dart';
import 'package:smoth_movie_app/features/movies/data/source/remote/movies_remote_data_source.dart';
import 'package:smoth_movie_app/features/movies/data/source/remote/recently_update_movies_remote_data_source.dart';
import 'package:smoth_movie_app/features/movies/domain/repository/movies_repository.dart';
import 'package:smoth_movie_app/features/movies/domain/repository/recently_update_movies_repository.dart';
import 'package:smoth_movie_app/features/movies/domain/usecase/get_movies.dart';
import 'package:smoth_movie_app/features/movies/domain/usecase/get_recently_movies.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/bloc/detail_movie/detail_movie_bloc.dart';
import 'package:smoth_movie_app/features/movies/presentation/bloc/movies/movies_bloc.dart';
import 'package:smoth_movie_app/features/movies/presentation/bloc/recently_update_movies/recently_update_movies_bloc.dart';
import 'package:smoth_movie_app/features/recommend_movies/data/repository/recommend_movies_repository_impl.dart';
import 'package:smoth_movie_app/features/recommend_movies/data/source/remote/recommend_movies_remote_data_source.dart';
import 'package:smoth_movie_app/features/recommend_movies/domain/repository/recommend_movies_repository.dart';
import 'package:smoth_movie_app/features/recommend_movies/domain/usecase/get_recommend_movies.dart';
import 'package:smoth_movie_app/features/recommend_movies/presentation/bloc/recommend_movies/recommend_movies_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initCoreDependencies();
  _initMoviesFeature();
  _initRecommendMoviesDependencies();
  _initDetailMovieFeature();
  _initSearchFeature();
  _initKhoPhimFeature();
}

void _initCoreDependencies() {
  serviceLocator.registerLazySingleton(() => AppService.shared);
}

// ===== Feature: Movies =====
void _initMoviesFeature() {
  _initMoviesListDependencies();
  _initRecentlyUpdatedMoviesDependencies();
  _initSimilarMoviesDependencies();
  _initMoviesSortByTimeDependencies();
}

void _initMoviesListDependencies() {
  serviceLocator.registerLazySingleton<HomeMoviesLocalDataSource>(
    () => HomeMoviesLocalDataSourceImpl(
      HiveManager.homeMoviesBox,
    ),
  );
  serviceLocator.registerFactory<MoviesRemoteDataSource>(
    () => MoviesRemoteDataSourceImpl(client: serviceLocator<AppService>()),
  );
  serviceLocator.registerFactory<MoviesRepository>(
    () => MoviesRepositoryImpl(
      moviesRemoteDataSource: serviceLocator(),
      homeMoviesLocalDataSource: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => GetMovies(moviesRepository: serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => MoviesBloc(usecase: serviceLocator()),
  );
}

void _initRecentlyUpdatedMoviesDependencies() {
  serviceLocator.registerFactory<RecentlyUpdateMoviesRemoteDataSource>(
    () => RecentlyUpdateMoviesRemoteDataSourceImpl(
      client: serviceLocator<AppService>(),
    ),
  );
  serviceLocator.registerFactory<RecentlyUpdateMoviesRepository>(
    () => RecentlyUpdateMoviesRepositoryImpl(
      recentlyUpdateMoviesRemoteDataSource: serviceLocator(),
      homeMoviesLocalDataSource: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => GetRecentlyMovies(
      recentlyUpdateMoviesRepository: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => RecentlyUpdateMoviesBloc(serviceLocator()),
  );
}

void _initSimilarMoviesDependencies() {
  serviceLocator.registerFactory<SimilarMoviesRemoteDataSource>(
    () => SimilarMoviesRemoteDataSourceImpl(serviceLocator<AppService>()),
  );
  serviceLocator.registerFactory<SimilarMoviesRepository>(
    () => SimilarRepositoryImpl(serviceLocator()),
  );
  serviceLocator.registerFactory(() => GetSimilarMovies(serviceLocator()));
  serviceLocator.registerFactory(() => SimilarMoviesBloc(serviceLocator()));
}

void _initMoviesSortByTimeDependencies() {
  serviceLocator.registerFactory<MoviesSortbyModifiedTimeRemoteDataSource>(
    () => MoviesSortbyModifiedTimeRemoteDataSourceImpl(
      client: serviceLocator<AppService>(),
    ),
  );
  serviceLocator.registerFactory<MoviesSortbyTimeRepository>(
    () => MoviesSortbyTimeRepositoryImpl(serviceLocator()),
  );
  serviceLocator.registerFactory(() => GetMoviesSortbyTime(serviceLocator()));
  serviceLocator.registerFactory(() => MoviesSortByTimeBloc(serviceLocator()));
}

// ===== Feature: Movie Detail =====
void _initDetailMovieFeature() {
  _initMovieDetailDependencies();
}

void _initMovieDetailDependencies() {
  serviceLocator.registerFactory<DetailMovieRemoteDataSource>(
    // Use Dio singleton for movie_detail after HTTP->Dio migration.
    () => DetailMovieRemoteDataSourceImpl(client: serviceLocator<AppService>()),
  );
  serviceLocator.registerFactory<DetailMovieRepository>(
    () => DetailMovieRepositoryImpl(
      detailMovieRemoteDataSource: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => GetDetailMovie(detailMovieRepository: serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => DetailMovieBloc(getDetailMovie: serviceLocator<GetDetailMovie>()),
  );
}

// ===== Feature: Search =====
void _initSearchFeature() {
  _initSearchMovieDependencies();
}

void _initSearchMovieDependencies() {
  serviceLocator.registerLazySingleton<SearchHistoryLocalDataSource>(
    () => SearchHistoryLocalDataSourceImpl(
      HiveManager.searchHistoryBox,
    ),
  );
  serviceLocator.registerFactory<SearchHistoryRepository>(
    () => SearchHistoryRepositoryImpl(
      localDataSource: serviceLocator<SearchHistoryLocalDataSource>(),
    ),
  );
  serviceLocator.registerFactory(
    () => GetSearchHistory(repository: serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => SaveSearchKeyword(repository: serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => DeleteSearchKeyword(repository: serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => ClearSearchHistory(repository: serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => SearchHistoryCubit(
      getSearchHistory: serviceLocator(),
      saveSearchKeyword: serviceLocator(),
      deleteSearchKeyword: serviceLocator(),
      clearSearchHistory: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory<SearchMovieRemoteDataSource>(
    () => SearchMovieRemoteDatasourceImpl(client: serviceLocator<AppService>()),
  );
  serviceLocator.registerFactory<SearchMoviesRepository>(
    () => SearchMoviesRepositoryImpl(remoteDatasource: serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => GetSearchMovies(searchMoviesRepository: serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => GetSearchSuggestions(searchMoviesRepository: serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => SearchBloc(
      getSearchMovies: serviceLocator<GetSearchMovies>(),
      getSearchSuggestions: serviceLocator<GetSearchSuggestions>(),
    ),
  );
}

// ===== Feature: Kho Phim =====
void _initKhoPhimFeature() {
  _initKhoPhimCategoriesDependencies();
  _initKhoPhimCountriesDependencies();
  _initKhoPhimMoviesDependencies();
}

void _initKhoPhimCategoriesDependencies() {
  serviceLocator.registerFactory<CategoriesRemoteDataSource>(
    () => CategoriesRemoteDataSourceImpl(client: serviceLocator<AppService>()),
  );
  serviceLocator.registerFactory<CategoriesRepository>(
    () => CategoriesRepositoryImpl(serviceLocator()),
  );
  serviceLocator.registerFactory(() => GetCategories(serviceLocator()));
  serviceLocator.registerFactory(() => CategoryListBloc(serviceLocator()));
}

void _initKhoPhimCountriesDependencies() {
  serviceLocator.registerFactory<CountriesRemoteDataSource>(
    () => CountriesRemoteDataSourceImpl(client: serviceLocator<AppService>()),
  );
  serviceLocator.registerFactory<CountriesRepository>(
    () => CountriesRepositoryImpl(serviceLocator()),
  );
  serviceLocator.registerFactory(() => GetCountries(serviceLocator()));
  serviceLocator.registerFactory(() => CountriesBloc(serviceLocator()));
}

void _initKhoPhimMoviesDependencies() {
  serviceLocator.registerFactory<KhoPhimMoviesRemoteDataSource>(
    () => KhoPhimMoviesRemoteDataSourceImpl(serviceLocator<AppService>()),
  );
  serviceLocator.registerFactory<KhoPhimMoviesRepository>(
    () => KhoPhimMoviesRepositoryImpl(serviceLocator()),
  );
  serviceLocator.registerFactory(() => GetKhoPhimMovies(serviceLocator()));
  serviceLocator.registerFactory(() => KhoPhimMoviesBloc(serviceLocator()));
}

// ===== Feature: Recommend Movies =====
void _initRecommendMoviesDependencies() {
  serviceLocator.registerFactory<RecommendMoviesRemoteDataSource>(
    () => RecommendMoviesRemoteDataSourceImpl(
      client: serviceLocator<AppService>(),
    ),
  );
  serviceLocator.registerFactory<RecommendMoviesRepository>(
    () => RecommendMoviesRepositoryImpl(
      remoteDataSource: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => GetRecommendMovies(repository: serviceLocator()),
  );
  serviceLocator.registerFactory(
    () => RecommendMoviesBloc(usecase: serviceLocator()),
  );
}
