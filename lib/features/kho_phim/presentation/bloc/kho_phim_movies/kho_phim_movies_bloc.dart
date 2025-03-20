import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smoth_movie_app/core/bloc/kho_phim_movies_state_status.dart';
import 'package:smoth_movie_app/features/kho_phim/domain/usecase/get_kho_phim_movies.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';

part 'kho_phim_movies_event.dart';
part 'kho_phim_movies_state.dart';
part 'kho_phim_movies_bloc.freezed.dart';

class KhoPhimMoviesBloc extends Bloc<KhoPhimMoviesEvent, KhoPhimMoviesState> {
  final GetKhoPhimMovies usecase;
  KhoPhimMoviesBloc(this.usecase) : super(const KhoPhimMoviesState()) {
    on<GetKhoPhimMoviesEvent>((event, emit) async {
      List<MovieItemEntity> movies = const [];
      if (state.categorySlug != event.categorySlug ||
          state.countrySlug != event.countrySlug ||
          state.langSlug != event.lang ||
          state.yearSlug != event.year) {
        emit(state.copyWith(page: 1, status: KhoPhimMoviesStateStatus.loading));
      }
      if (state.isEnd) {
        emit(state.copyWith(isEnd: false));
      }
      final res = await usecase.call(GetKhoPhimMoviesParams(
        countrySlug: event.countrySlug,
        page: state.page,
        sortField: event.sortField,
        sortType: event.sortType,
        lang: event.lang,
        categorySlug: event.categorySlug,
        year: event.year,
        limit: event.limit,
      ));
      res.fold(
        (err) => emit(state.copyWith(status: KhoPhimMoviesStateStatus.error)),
        (data) {
          movies = data;
          if (movies.isEmpty || movies.length < event.limit) {
            emit(state.copyWith(
              status: KhoPhimMoviesStateStatus.success,
              movies: (state.categorySlug != event.categorySlug ||
                      state.countrySlug != event.countrySlug ||
                      state.langSlug != event.lang ||
                      state.yearSlug != event.year)
                  ? movies
                  : [...state.movies, ...movies],
              categorySlug: event.categorySlug,
              countrySlug: event.countrySlug,
              langSlug: event.lang,
              yearSlug: event.year,
              isEnd: true,
            ));
          } else {
            emit(state.copyWith(
              status: KhoPhimMoviesStateStatus.success,
              movies: (state.categorySlug != event.categorySlug ||
                      state.countrySlug != event.countrySlug ||
                      state.langSlug != event.lang ||
                      state.yearSlug != event.year)
                  ? movies
                  : [...state.movies, ...movies],
              page: state.page + 1,
              countrySlug: event.countrySlug,
              categorySlug: event.categorySlug,
              langSlug: event.lang,
              yearSlug: event.year,
            ));
          }
        },
      );
    });
  }
}
