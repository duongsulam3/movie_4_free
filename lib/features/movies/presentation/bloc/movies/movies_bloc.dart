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

  Future<void> fetchMovie(
    GetListMovies event,
    Emitter<MoviesState> emit,
  ) async {
    if (_shouldSkipFetch()) return;

    final requestPage = state.page;

    // fetch cached data and render first
    await _fetchCacheFirst(event, emit, requestPage);

    // fetch remote data and do re-render flow
    await _fetchAndHandleRemote(event, emit, requestPage);
  }

  Future<void> _fetchCacheFirst(
    GetListMovies event,
    Emitter<MoviesState> emit,
    int requestPage,
  ) async {
    await _emitCachedMovies(event, emit);

    await _fetchAndHandleRemote(event, emit, requestPage);
  }

  bool _shouldSkipFetch() => state.isEnd;

  Future<void> _emitCachedMovies(
    GetListMovies event,
    Emitter<MoviesState> emit,
  ) async {
    final cached = await usecase.getCachedMovies(
      limit: event.limit,
      cateName: event.path,
    );

    if (cached.isEmpty) {
      emit(state.copyWith(status: MoviesStateStatus.loading));
      return;
    }

    emit(state.copyWith(
      status: MoviesStateStatus.success,
      movies: cached,
      isEnd: true,
      page: 2,
    ));
  }

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

  void _handleRemoteError(Emitter<MoviesState> emit) {
    if (state.movies.isNotEmpty) {
      return;
    }

    emit(state.copyWith(status: MoviesStateStatus.error));
  }

  void _handleRemoteSuccess(
    GetListMovies event,
    Emitter<MoviesState> emit,
    List<MovieItemEntity>? movies,
  ) {
    if (movies == null) return;

    emit(state.copyWith(
      status: MoviesStateStatus.success,
      movies: movies,
      isEnd: true,
      page: 2,
    ));
  }
}
