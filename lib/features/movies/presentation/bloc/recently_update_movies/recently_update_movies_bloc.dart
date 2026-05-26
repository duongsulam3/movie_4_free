import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../common/utils/enum/movies_state_status.dart';
import '../../../domain/entities/currently_update_movies/recently_update_list_item.dart';
import '../../../domain/entities/currently_update_movies/recently_update_movies_fetch_result.dart';
import '../../../domain/usecase/get_recently_movies.dart';

part 'recently_update_movies_event.dart';
part 'recently_update_movies_state.dart';
part 'recently_update_movies_bloc.freezed.dart';

class RecentlyUpdateMoviesBloc
    extends Bloc<RecentlyUpdateMoviesEvent, RecentlyUpdateMoviesState> {
  final GetRecentlyMovies getRecentlyMovies;
  RecentlyUpdateMoviesBloc(this.getRecentlyMovies)
      : super(const RecentlyUpdateMoviesState()) {
    on<GetRecentlyUpdateMovies>(_handleGetRecentlyUpdateMovies);
  }

  // ===== recentlyUpdate orchestration =====
  Future<void> _handleGetRecentlyUpdateMovies(
    GetRecentlyUpdateMovies event,
    Emitter<RecentlyUpdateMoviesState> emit,
  ) async {
    // fetch cached data and render first
    await _emitCachedMoviesIfNeeded(emit);

    // if movies not exist in cache, show loading state
    if (state.movies.isEmpty) {
      emit(state.copyWith(status: MoviesStateStatus.loading));
    }

    // fetch remote data and do re-render flow
    await _fetchAndHandleRemote(emit);
  }

  // ===== recentlyUpdate cache-first section =====
  Future<void> _emitCachedMoviesIfNeeded(
    Emitter<RecentlyUpdateMoviesState> emit,
  ) async {
    final cached = await getRecentlyMovies.getCachedRecentlyMovies();
    if (cached.isEmpty) return;

    emit(state.copyWith(
      status: MoviesStateStatus.success,
      movies: cached,
    ));
  }

  // ===== recentlyUpdate remote section =====
  Future<void> _fetchAndHandleRemote(
    Emitter<RecentlyUpdateMoviesState> emit,
  ) async {
    final res = await getRecentlyMovies.call(const GetRecentlyMoviesParams());
    res.fold(
      (_) => _handleRemoteError(emit),
      (result) => _handleRemoteSuccess(emit, result),
    );
  }

  // ===== recentlyUpdate remote-error section =====
  void _handleRemoteError(Emitter<RecentlyUpdateMoviesState> emit) {
    if (state.movies.isNotEmpty) {
      // Keep cached carousel data visible when offline refresh fails.
      return;
    }

    emit(state.copyWith(status: MoviesStateStatus.error));
  }

  // ===== recentlyUpdate remote-success section =====
  void _handleRemoteSuccess(
    Emitter<RecentlyUpdateMoviesState> emit,
    RecentlyUpdateMoviesFetchResult result,
  ) {
    if (!result.hasChangedFromCache && state.movies.isNotEmpty) {
      return;
    }

    emit(state.copyWith(
      status: MoviesStateStatus.success,
      movies: result.movies,
    ));
  }
}
