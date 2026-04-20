import 'package:get_it/get_it.dart';
import 'package:smoth_movie_app/core/utils/network/app_service.dart';
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
import 'package:smoth_movie_app/features/nguonc_categories/data/repository/nguonc_movies_by_cate_repository_impl.dart';
import 'package:smoth_movie_app/features/nguonc_categories/data/source/remote/nguonc_movies_by_category_remote_datasource.dart';
import 'package:smoth_movie_app/features/nguonc_categories/domain/repository/nguonc_movies_by_cate_repository.dart';
import 'package:smoth_movie_app/features/nguonc_categories/domain/usecase/nguonc_get_movies_by_cate.dart';
import 'package:smoth_movie_app/features/nguonc_categories/presentation/bloc/movies_by_category_bloc.dart';
import 'package:smoth_movie_app/features/nguonc_movie_detail/data/repository/nguonc_movie_detail_repository_impl.dart';
import 'package:smoth_movie_app/features/nguonc_movie_detail/data/source/remote/nguonc_movie_detail_remote_datasource.dart';
import 'package:smoth_movie_app/features/nguonc_movie_detail/domain/repository/nguonc_movie_detail_repository.dart';
import 'package:smoth_movie_app/features/nguonc_movie_detail/domain/usecase/get_nguonc_movie_detail.dart';
import 'package:smoth_movie_app/features/nguonc_movie_detail/presentation/bloc/nguonc_movie_detail_bloc.dart';
import 'package:smoth_movie_app/features/nguonc_search_movies/data/repository/nguonc_search_movies_repository_impl.dart';
import 'package:smoth_movie_app/features/nguonc_search_movies/data/source/remote/search_movies_remote_data_source.dart';
import 'package:smoth_movie_app/features/nguonc_search_movies/domain/repository/nguonc_search_movies_repository.dart';
import 'package:smoth_movie_app/features/nguonc_search_movies/domain/usecase/nguonc_get_search_films.dart';
import 'package:smoth_movie_app/features/nguonc_search_movies/presentation/bloc/nguonc_search_bloc.dart';
import 'package:smoth_movie_app/features/search/data/repository/search_movies_repository_impl.dart';
import 'package:smoth_movie_app/features/search/data/source/remote/search_movie_remote_datasource.dart';
import 'package:smoth_movie_app/features/search/domain/repository/search_movies_repository.dart';
import 'package:smoth_movie_app/features/search/domain/usecase/get_search_movies.dart';
import 'package:smoth_movie_app/features/search/domain/usecase/get_search_suggestions.dart';
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
  _initCoreDependencies();
  _initMoviesFeature();
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
  _initNguoncMoviesByCategoryDependencies();
}

void _initMoviesListDependencies() {
  serviceLocator.registerFactory<MoviesRemoteDataSource>(
    () => MoviesRemoteDataSourceImpl(client: serviceLocator<AppService>()),
  );
  serviceLocator.registerFactory<MoviesRepository>(
    () => MoviesRepositoryImpl(moviesRemoteDataSource: serviceLocator()),
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

void _initNguoncMoviesByCategoryDependencies() {
  serviceLocator.registerFactory<NguoncMoviesByCategoryRemoteDatasource>(
    () => NguoncMoviesByCategoryRemoteDatasourceImpl(
      client: serviceLocator<AppService>(),
    ),
  );
  serviceLocator.registerFactory<NguoncMoviesByCateRepository>(
    () => NguoncMoviesByCateRepositoryImpl(serviceLocator()),
  );
  serviceLocator.registerFactory(() => NguoncGetMoviesByCate(serviceLocator()));
  serviceLocator.registerFactory(() => MoviesByCategoryBloc(serviceLocator()));
}

// ===== Feature: Movie Detail =====
void _initDetailMovieFeature() {
  _initMovieDetailDependencies();
  _initNguoncMovieDetailDependencies();
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

void _initNguoncMovieDetailDependencies() {
  serviceLocator.registerFactory<NguoncMovieDetailRemoteDatasource>(
    () => NguoncMovieDetailRemoteDatasourceImpl(
      client: serviceLocator<AppService>(),
    ),
  );
  serviceLocator.registerFactory<NguoncMovieDetailRepository>(
    () => NguoncMovieDetailRepositoryImpl(serviceLocator()),
  );
  serviceLocator.registerFactory(() => GetNguoncMovieDetail(serviceLocator()));
  serviceLocator.registerFactory(
    () => NguoncMovieDetailBloc(serviceLocator<GetNguoncMovieDetail>()),
  );
}

// ===== Feature: Search =====
void _initSearchFeature() {
  _initSearchMovieDependencies();
  _initNguoncSearchDependencies();
}

void _initSearchMovieDependencies() {
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

void _initNguoncSearchDependencies() {
  serviceLocator.registerFactory<NguonCSearchMoviesRemoteDataSource>(
    () => NguonCSearchMoviesRemoteDataSourceImpl(
      client: serviceLocator<AppService>(),
    ),
  );
  serviceLocator.registerFactory<NguoncSearchMoviesRepository>(
    () => NguoncSearchMoviesRepositoryImpl(serviceLocator()),
  );
  serviceLocator.registerFactory(() => NguoncGetSearchFilms(serviceLocator()));
  serviceLocator.registerFactory(() => NguoncSearchBloc(serviceLocator()));
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
