import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../common/utils/enum/movies_state_status.dart';
import '../../../domain/entities/movies_page/movie_item.dart';
import '../../../domain/entities/movies_page/movies_fetch_result.dart';
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
  Future<void> fetchMovie(
    GetListMovies event,
    Emitter<MoviesState> emit,
  ) async {
    if (_shouldSkipFetch()) return;

    final requestPage = state.page;

    if (event.preferCacheFirst) {
      await _fetchCacheFirst(event, emit, requestPage);
      return;
    }

    emit(state.copyWith(status: MoviesStateStatus.loading));
    await _fetchAndHandleRemote(event, emit, requestPage);
  }

  Future<void> _fetchCacheFirst(
    GetListMovies event,
    Emitter<MoviesState> emit,
    int requestPage,
  ) async {
    await _emitCachedMoviesIfNeeded(event, emit);
    if (state.movies.isEmpty) {
      emit(state.copyWith(status: MoviesStateStatus.loading));
    }
    await _fetchAndHandleRemote(event, emit, requestPage);
  }

  // ===== fetchMovie guard section =====
  bool _shouldSkipFetch() => state.isEnd;

  // ===== fetchMovie cache-first section =====
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
      (result) => _handleRemoteSuccess(event, emit, result),
    );
  }

  // ===== fetchMovie remote-error section =====
  void _handleRemoteError(Emitter<MoviesState> emit) {
    if (state.movies.isNotEmpty) {
      return;
    }

    emit(state.copyWith(status: MoviesStateStatus.error));
  }

  // ===== fetchMovie remote-success section =====
  void _handleRemoteSuccess(
    GetListMovies event,
    Emitter<MoviesState> emit,
    MoviesFetchResult result,
  ) {
    if (event.preferCacheFirst) {
      _emitReplaceForCacheFirst(emit, result);
      return;
    }
    _emitMergedMovies(event, emit, result);
  }

  // ===== fetchMovie cache-first success section =====
  void _emitReplaceForCacheFirst(
    Emitter<MoviesState> emit,
    MoviesFetchResult result,
  ) {
    if (!result.hasChangedFromCache && state.movies.isNotEmpty) {
      return;
    }

    emit(state.copyWith(
      status: MoviesStateStatus.success,
      movies: result.movies,
      isEnd: true,
      page: 2,
    ));
  }

  // ===== fetchMovie pagination success section =====
  void _emitMergedMovies(
    GetListMovies event,
    Emitter<MoviesState> emit,
    MoviesFetchResult result,
  ) {
    if (!result.hasChangedFromCache && state.movies.isNotEmpty) {
      return;
    }

    final merged = [...state.movies, ...result.movies];
    final limitedMerged = List.generate(
      event.limit,
      (i) => merged[i],
      growable: false,
    );

    if (result.movies.length < event.limit) {
      emit(state.copyWith(
        status: MoviesStateStatus.success,
        isEnd: true,
        movies: limitedMerged,
      ));
      return;
    }

    emit(state.copyWith(
      status: MoviesStateStatus.success,
      movies: limitedMerged,
      isEnd: event.isRefresh ? false : true,
      page: state.page + 1,
    ));
  }
}
