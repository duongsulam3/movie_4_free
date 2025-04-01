import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smoth_movie_app/core/utils/enum/movies_sortby_time/movies_sortby_time_status.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';
import 'package:smoth_movie_app/features/movies/domain/usecase/get_movies_sortby_time.dart';

part 'movies_sort_by_time_event.dart';
part 'movies_sort_by_time_state.dart';
part 'movies_sort_by_time_bloc.freezed.dart';

class MoviesSortByTimeBloc
    extends Bloc<MoviesSortByTimeEvent, MoviesSortByTimeState> {
  final GetMoviesSortbyTime usecase;
  MoviesSortByTimeBloc(this.usecase) : super(const MoviesSortByTimeState()) {
    on<GetSortByTimeMovies>((event, emit) async {
      emit(state.copyWith(status: MoviesSortByTimeStateStatus.loading));
      List<MovieItemEntity> movies = const [];
      final res = await usecase.call(GetMoviesSortbyTimeParams(
        page: event.page,
        limit: event.limit,
        sortfield: event.sortfield,
        cateName: event.cateName,
      ));
      res.fold(
        (err) => emit(state.copyWith(
          status: MoviesSortByTimeStateStatus.error,
        )),
        (data) {
          movies = data;
          emit(state.copyWith(
            status: MoviesSortByTimeStateStatus.success,
            movies: movies,
          ));
        },
      );
    });
  }
}
