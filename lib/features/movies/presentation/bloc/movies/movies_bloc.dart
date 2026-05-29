import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../common/utils/enum/movies_state_status.dart';
import '../../../domain/entities/movies_page/movie_item.dart';
import '../../../domain/usecase/get_movies.dart';

part 'movies_bloc.freezed.dart';
part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  static const int previewItemLimit = 9;
  static const int feedPageLimit = 30;

  final GetMovies usecase;

  MoviesBloc({required this.usecase}) : super(const MoviesState()) {
    on<LoadCategoryPreview>(_onLoadCategoryPreview);
    on<LoadCategoryFeed>(_onLoadCategoryFeed);
    on<LoadMoreCategoryFeed>(_onLoadMoreCategoryFeed);
  }

  Future<void> _onLoadCategoryPreview(
    LoadCategoryPreview event,
    Emitter<MoviesState> emit,
  ) async {
    final cached = await usecase.getCachedMovies(
      limit: previewItemLimit,
      cateName: event.path,
    );
    final previewFromCache = _takeMovies(cached, previewItemLimit);

    if (previewFromCache.isEmpty) {
      // show skeleton if no cached movies
      emit(state.copyWith(status: MoviesStateStatus.loading));
    } else {
      // show cached movies
      emit(state.copyWith(
        status: MoviesStateStatus.success,
        movies: previewFromCache,
        categoryPath: event.path,
      ));
    }

    // fetch latest movies for preview
    final res = await usecase.call(
      GetMoviesParams(
        page: 1,
        cateName: event.path,
        limit: previewItemLimit,
      ),
    );

    res.fold(
      (_) => _emitErrorIfEmpty(emit),
      (movies) {
        // if movies is null, remote data is equal to cached data
        // no need to update the preview
        if (movies == null) return;

        // if cached movies changed, update the preview
        emit(state.copyWith(
          status: MoviesStateStatus.success,
          movies: _takeMovies(movies, previewItemLimit),
          categoryPath: event.path,
        ));
      },
    );
  }

  Future<void> _onLoadCategoryFeed(
    LoadCategoryFeed event,
    Emitter<MoviesState> emit,
  ) async {
    final isNewCategory = state.categoryPath != event.path;

    if (isNewCategory) {
      emit(state.copyWith(
        status: MoviesStateStatus.loading,
        movies: const [],
        page: 1,
        isEnd: false,
        categoryPath: event.path,
      ));
    }

    // load cached movies for feed
    final cached = await usecase.getCachedMovies(
      limit: feedPageLimit,
      cateName: event.path,
    );

    // load feed from cache
    final feedFromCache = _takeMovies(cached, feedPageLimit);

    if (feedFromCache.isEmpty) {
      // show skeleton if no cached movies for feed
      emit(state.copyWith(
        status: MoviesStateStatus.loading,
        categoryPath: event.path,
      ));
    } else {
      // show cached movies for feed
      emit(state.copyWith(
        status: MoviesStateStatus.success,
        movies: feedFromCache,
        categoryPath: event.path,
        page: 1,
        isEnd: false,
      ));
    }

    // fetch latest movies for feed
    final res = await usecase.call(
      GetMoviesParams(
        page: 1,
        cateName: event.path,
        limit: feedPageLimit,
      ),
    );

    res.fold(
      (_) => _emitErrorIfEmpty(emit),
      (movies) => _emitFeedPage(
        emit: emit,
        movies: movies,
        path: event.path,
        replaceExisting: true,
      ),
    );
  }

  Future<void> _onLoadMoreCategoryFeed(
    LoadMoreCategoryFeed event,
    Emitter<MoviesState> emit,
  ) async {
    if (state.isEnd || state.categoryPath != event.path) return;

    final res = await usecase.call(
      GetMoviesParams(
        page: state.page,
        cateName: event.path,
        limit: feedPageLimit,
        persistToCache: false,
      ),
    );

    res.fold(
      (_) {},
      (movies) => _emitFeedPage(
        emit: emit,
        movies: movies,
        path: event.path,
        replaceExisting: false,
      ),
    );
  }

  void _emitFeedPage({
    required Emitter<MoviesState> emit,
    required List<MovieItemEntity>? movies,
    required String path,
    required bool replaceExisting,
  }) {
    if (movies == null) return;

    final isLastPage = movies.isEmpty || movies.length < feedPageLimit;
    final nextMovies = replaceExisting ? movies : [...state.movies, ...movies];

    emit(state.copyWith(
      status: MoviesStateStatus.success,
      movies: nextMovies,
      categoryPath: path,
      isEnd: isLastPage,
      page: isLastPage ? state.page : state.page + 1,
    ));
  }

  List<MovieItemEntity> _takeMovies(
    List<MovieItemEntity> movies,
    int limit,
  ) {
    if (movies.length <= limit) return movies;

    // 
    return movies.sublist(0, limit);
  }

  void _emitErrorIfEmpty(Emitter<MoviesState> emit) {
    if (state.movies.isNotEmpty) return;
    emit(state.copyWith(status: MoviesStateStatus.error));
  }
}
