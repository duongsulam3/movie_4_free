import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../common/utils/enum/movies_state_status.dart';
import '../../../domain/entities/currently_update_movies/recently_update_list_item.dart';
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

  Future<void> _handleGetRecentlyUpdateMovies(
    GetRecentlyUpdateMovies event,
    Emitter<RecentlyUpdateMoviesState> emit,
  ) async {
    // fetch cached data and render first
    await _emitCachedMovies(emit);

    // fetch remote data and do re-render flow
    await _fetchAndHandleRemote(emit);
  }

  Future<void> _emitCachedMovies(
    Emitter<RecentlyUpdateMoviesState> emit,
  ) async {
    final cached = await getRecentlyMovies.getCachedRecentlyMovies();

    if (cached.isEmpty) {
      emit(state.copyWith(status: MoviesStateStatus.loading));
      return;
    }

    emit(state.copyWith(
      status: MoviesStateStatus.success,
      movies: cached,
    ));
  }

  Future<void> _fetchAndHandleRemote(
    Emitter<RecentlyUpdateMoviesState> emit,
  ) async {
    final res = await getRecentlyMovies.call(const GetRecentlyMoviesParams());
    res.fold(
      (_) => _handleRemoteError(emit),
      (movies) => _handleRemoteSuccess(emit, movies),
    );
  }

  void _handleRemoteError(Emitter<RecentlyUpdateMoviesState> emit) {
    if (state.movies.isNotEmpty) return;

    emit(state.copyWith(status: MoviesStateStatus.error));
  }

  void _handleRemoteSuccess(
    Emitter<RecentlyUpdateMoviesState> emit,
    List<RecentlyUpdateListItemEntity>? movies,
  ) {
    if (movies == null) return;

    emit(state.copyWith(
      status: MoviesStateStatus.success,
      movies: movies,
    ));
  }
}
