import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../common/utils/enum/movies_state_status.dart';
import '../../../domain/entities/movies_page/movie_item.dart';
import '../../../domain/usecase/get_movies.dart';

part 'movies_bloc.freezed.dart';
part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetMovies usecase;
  MoviesBloc({required this.usecase}) : super(const MoviesState()) {
    on<GetListMovies>(fetchMovie);
  }

  // ===== fetchMovie orchestration =====
  // Scope: high-level flow only (guard -> cache-first -> remote refresh).
  fetchMovie(
    GetListMovies event,
    Emitter<MoviesState> emit,
  ) async {
    if (_shouldSkipFetch()) return;
    emit(state.copyWith(status: MoviesStateStatus.loading));

    final requestPage = state.page;
    await _emitCachedMoviesIfNeeded(event, emit);
    await _fetchAndHandleRemote(event, emit, requestPage);
  }

  // ===== fetchMovie guard section =====
  bool _shouldSkipFetch() => state.isEnd;

  // ===== fetchMovie cache-first section =====
  // Scope: read local cache and emit immediate UI state if available.
  Future<void> _emitCachedMoviesIfNeeded(
    GetListMovies event,
    Emitter<MoviesState> emit,
  ) async {
    if (!event.preferCacheFirst || state.movies.isNotEmpty) return;

    final cached = await usecase.getCachedMovies(
      limit: event.limit,
      cateName: event.path,
    );

    if (cached.isEmpty) return;

    emit(state.copyWith(
      status: MoviesStateStatus.success,
      movies: cached,
      isEnd: true,
      page: 2,
    ));
  }

  // ===== fetchMovie remote section =====
  // Scope: call usecase and route to success/error handlers.
  Future<void> _fetchAndHandleRemote(
    GetListMovies event,
    Emitter<MoviesState> emit,
    int requestPage,
  ) async {
    final res = await usecase.call(
      GetMoviesParams(
        page: requestPage,
        cateName: event.path,
        limit: event.limit,
      ),
    );

    res.fold(
      (_) => _handleRemoteError(emit),
      (movies) => _handleRemoteSuccess(event, emit, movies),
    );
  }

  // ===== fetchMovie remote-error section =====
  void _handleRemoteError(Emitter<MoviesState> emit) {
    if (state.movies.isNotEmpty) {
      // Keep cached movies visible when offline refresh fails.
      return;
    }

    emit(state.copyWith(status: MoviesStateStatus.error));
  }

  // ===== fetchMovie remote-success section =====
  // Scope: choose cache-first replacement or paged merge strategy.
  void _handleRemoteSuccess(
    GetListMovies event,
    Emitter<MoviesState> emit,
    List<MovieItemEntity> movies,
  ) {
    if (event.preferCacheFirst) {
      _emitReplaceForCacheFirst(emit, movies);
      return;
    }
    _emitMergedMovies(event, emit, movies);
  }

  // ===== fetchMovie cache-first success section =====
  void _emitReplaceForCacheFirst(
    Emitter<MoviesState> emit,
    List<MovieItemEntity> movies,
  ) {
    if (listEquals(state.movies, movies)) return;
    emit(state.copyWith(
      status: MoviesStateStatus.success,
      movies: movies,
      isEnd: true,
      page: 2,
    ));
  }

  // ===== fetchMovie pagination success section =====
  void _emitMergedMovies(
    GetListMovies event,
    Emitter<MoviesState> emit,
    List<MovieItemEntity> movies,
  ) {
    final merged = [...state.movies, ...movies];
    if (listEquals(state.movies, merged)) return;

    if (movies.length < event.limit) {
      emit(state.copyWith(
        status: MoviesStateStatus.success,
        isEnd: true,
        movies: merged,
      ));
      return;
    }

    emit(state.copyWith(
      status: MoviesStateStatus.success,
      movies: merged,
      isEnd: event.isRefresh ? false : true,
      page: state.page + 1,
    ));
  }
}
