import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/currently_update_movies/recently_update_list_item.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';
import 'package:smoth_movie_app/features/movies/domain/usecase/get_anime_movies.dart';
import 'package:smoth_movie_app/features/movies/domain/usecase/get_recently_movies.dart';
import 'package:smoth_movie_app/features/movies/domain/usecase/get_series_movies.dart';
import 'package:smoth_movie_app/features/movies/domain/usecase/get_single_movies.dart';
import 'package:smoth_movie_app/features/movies/domain/usecase/get_tv_shows.dart';

part 'list_movie_item_bloc_event.dart';
part 'list_movie_item_bloc_state.dart';

class ListMovieItemBloc
    extends Bloc<ListMovieItemBlocEvent, ListMovieItemBlocState> {
  final GetRecentlyMovies _getRecentlyMovies;
  final GetAnimeMovies _getAnimeMovies;
  final GetSingleMovies _getSingleMovies;
  final GetTvShows _getTvShows;
  final GetSeriesMovies _getSeriesMovies;

  ListMovieItemBloc({
    required GetRecentlyMovies getRecentlyMovies,
    required GetAnimeMovies getAnimeMovies,
    required GetSingleMovies getSingleMovies,
    required GetTvShows getTvShows,
    required GetSeriesMovies getSeriesMovies,
  })  : _getRecentlyMovies = getRecentlyMovies,
        _getAnimeMovies = getAnimeMovies,
        _getSingleMovies = getSingleMovies,
        _getTvShows = getTvShows,
        _getSeriesMovies = getSeriesMovies,
        super(const ListMovieItemBlocInitial(list: [])) {
    on<GetRecentlyUpdateMovieList>(_getRecentlyUpdateMoviesBlocEvent);
    //
    on<GetAnimeMovieList>(_getAnimeMoviesBlocEvent);
    on<GetSingleMovieList>(_getSingleMoviesBlocEvent);
    on<GetTvShowsList>(_getTvShowsBlocEvent);
    on<GetSeriesMovieList>(
      (event, emit) async {
        final res = await _getSeriesMovies.call();
        res.fold(
          (err) => emit(GetSeriesMovieError(message: err.message)),
          (data) => emit(GetSeriesMovieSuccess(movies: data)),
        );
      },
    );
  }

  _getTvShowsBlocEvent(
    GetTvShowsList event,
    Emitter<ListMovieItemBlocState> emit,
  ) async {
    final res = await _getTvShows.call();
    res.fold(
      (err) => emit(GetTvShowsError(message: err.message)),
      (data) => emit(GetTvShowsSuccess(movies: data)),
    );
  }

  _getAnimeMoviesBlocEvent(
    GetAnimeMovieList event,
    Emitter<ListMovieItemBlocState> emit,
  ) async {
    final res = await _getAnimeMovies.call();
    res.fold(
      (err) => emit(GetListAnimeMovieError(message: err.message)),
      (data) => emit(GetListAnimeMovieSuccess(movies: data)),
    );
  }

  _getRecentlyUpdateMoviesBlocEvent(
    GetRecentlyUpdateMovieList event,
    Emitter<ListMovieItemBlocState> emit,
  ) async {
    final res = await _getRecentlyMovies.call(
      const GetRecentlyMoviesParams(),
    );
    res.fold(
      (error) => emit(
        GetListRecentlyUpdateMovieStateError(message: error.message),
      ),
      (movies) => emit(GetListRecentlyUpdateMovieStateSuccess(movies: movies)),
    );
  }

  _getSingleMoviesBlocEvent(
    GetSingleMovieList event,
    Emitter<ListMovieItemBlocState> emit,
  ) async {
    final res = await _getSingleMovies.call();
    res.fold(
      (err) => emit(GetListSingleMovieError(message: err.message)),
      (data) => emit(GetListSingleMovieSuccess(movies: data)),
    );
  }
}
