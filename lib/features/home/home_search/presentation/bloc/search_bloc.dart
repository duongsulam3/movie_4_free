import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smoth_movie_app/core/bloc/movies_state_status.dart';
import 'package:smoth_movie_app/features/home/home_search/domain/usecase/get_search_movies.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';
part 'search_bloc.freezed.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetSearchMovies getSearchMovies;
  SearchBloc({required this.getSearchMovies}) : super(const SearchState()) {
    on<GetSearchMoviesEvent>((event, emit) async {
      try {
        List<MovieItemEntity> movies = const [];
        if (state.isEnd) return;
        final res = await getSearchMovies.call(event.query);
        res.fold(
          (err) => emit(state.copyWith(status: MoviesStateStatus.error)),
          (data) {
            if (data.isEmpty) {
              emit(state.copyWith(isEnd: true));
            } else {
              movies = data;
              emit(state.copyWith(
                status: MoviesStateStatus.success,
                movies: [...state.movies, ...movies],
                page: state.page + 1,
              ));
            }
          },
        );
      } catch (e) {
        log(e.toString());
        emit(state.copyWith(status: MoviesStateStatus.error));
      }
    });
  }
}
