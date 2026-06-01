import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smoth_movie_app/common/utils/enum/kho_phim/kho_phim_movies_state_status.dart';
import 'package:smoth_movie_app/features/kho_phim/domain/usecase/get_kho_phim_movies.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';

part 'kho_phim_movies_event.dart';
part 'kho_phim_movies_state.dart';
part 'kho_phim_movies_bloc.freezed.dart';

class KhoPhimMoviesBloc extends Bloc<KhoPhimMoviesEvent, KhoPhimMoviesState> {
  final GetKhoPhimMovies usecase;

  KhoPhimMoviesBloc(this.usecase) : super(const KhoPhimMoviesState()) {
    on<FetchKhoPhimMovies>(_onFetchKhoPhimMovies);
    on<LoadMoreKhoPhimMovies>(_onLoadMoreKhoPhimMovies);
  }

  bool _filtersChanged(KhoPhimMoviesQuery query) {
    return state.categorySlug != query.categorySlug ||
        state.countrySlug != query.countrySlug ||
        state.langSlug != query.lang ||
        state.yearSlug != query.year;
  }

  GetKhoPhimMoviesParams _paramsFromQuery(
    KhoPhimMoviesQuery query, {
    required int page,
  }) {
    return GetKhoPhimMoviesParams(
      countrySlug: query.countrySlug,
      page: page,
      sortField: query.sortField,
      sortType: query.sortType,
      lang: query.lang,
      categorySlug: query.categorySlug,
      year: query.year,
      limit: query.limit,
    );
  }

  Future<void> _onFetchKhoPhimMovies(
    FetchKhoPhimMovies event,
    Emitter<KhoPhimMoviesState> emit,
  ) async {
    final query = event.query;

    if (_filtersChanged(query)) {
      emit(state.copyWith(
        page: 1,
        status: KhoPhimMoviesStateStatus.loading,
        isLoadingMore: false,
        loadMoreFailed: false,
      ));
    }

    final res = await usecase.call(_paramsFromQuery(query, page: 1));

    res.fold(
      (_) => _emitInitialError(emit),
      (movies) => _emitInitialSuccess(emit, query, movies),
    );
  }

  Future<void> _onLoadMoreKhoPhimMovies(
    LoadMoreKhoPhimMovies event,
    Emitter<KhoPhimMoviesState> emit,
  ) async {
    final query = event.query;

    if (_filtersChanged(query)) return;
    if (state.isEnd || state.isLoadingMore) return;

    emit(state.copyWith(isLoadingMore: true, loadMoreFailed: false));

    final res = await usecase.call(_paramsFromQuery(query, page: state.page));

    res.fold(
      (_) => emit(state.copyWith(
        isLoadingMore: false,
        loadMoreFailed: true,
      )),
      (movies) => _emitLoadMoreSuccess(emit, query, movies),
    );
  }

  void _emitInitialSuccess(
    Emitter<KhoPhimMoviesState> emit,
    KhoPhimMoviesQuery query,
    List<MovieItemEntity> movies,
  ) {
    final isLastPage = movies.isEmpty || movies.length < query.limit;

    emit(state.copyWith(
      status: KhoPhimMoviesStateStatus.success,
      movies: movies,
      categorySlug: query.categorySlug,
      countrySlug: query.countrySlug,
      langSlug: query.lang,
      yearSlug: query.year,
      isEnd: isLastPage,
      page: isLastPage ? 1 : 2,
      isLoadingMore: false,
      loadMoreFailed: false,
    ));
  }

  void _emitLoadMoreSuccess(
    Emitter<KhoPhimMoviesState> emit,
    KhoPhimMoviesQuery query,
    List<MovieItemEntity> movies,
  ) {
    final isLastPage = movies.isEmpty || movies.length < query.limit;

    emit(state.copyWith(
      status: KhoPhimMoviesStateStatus.success,
      movies: [...state.movies, ...movies],
      categorySlug: query.categorySlug,
      countrySlug: query.countrySlug,
      langSlug: query.lang,
      yearSlug: query.year,
      isEnd: isLastPage,
      page: isLastPage ? state.page : state.page + 1,
      isLoadingMore: false,
      loadMoreFailed: false,
    ));
  }

  void _emitInitialError(Emitter<KhoPhimMoviesState> emit) {
    if (state.movies.isNotEmpty) return;
    emit(state.copyWith(status: KhoPhimMoviesStateStatus.error));
  }
}
