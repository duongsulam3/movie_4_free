import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smoth_movie_app/core/bloc/movies_state_status.dart';
import 'package:smoth_movie_app/features/kho_phim/domain/usecase/get_kho_phim_movies.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';

part 'kho_phim_movies_event.dart';
part 'kho_phim_movies_state.dart';
part 'kho_phim_movies_bloc.freezed.dart';

class KhoPhimMoviesBloc extends Bloc<KhoPhimMoviesEvent, KhoPhimMoviesState> {
  final GetKhoPhimMovies usecase;
  KhoPhimMoviesBloc(this.usecase) : super(const KhoPhimMoviesState()) {
    on<GetKhoPhimMoviesEvent>((event, emit) async {
      log("trigged");
      log(state.isEnd.toString());
      List<MovieItemEntity> movies = const [];
      if (state.isEnd) return;
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
        (err) => emit(state.copyWith(status: MoviesStateStatus.error)),
        (data) {
          movies = data;
          if (movies.isEmpty || movies.length < 24) {
            emit(state.copyWith(isEnd: true));
          }
          emit(state.copyWith(
            status: MoviesStateStatus.success,
            movies: [...state.movies, ...movies],
            page: state.page + 1,
          ));
        },
      );
    });
  }
}
