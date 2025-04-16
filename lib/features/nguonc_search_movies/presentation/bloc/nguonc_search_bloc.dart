import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smoth_movie_app/core/utils/enum/search/search_page_status.dart';
import 'package:smoth_movie_app/features/nguonc_search_movies/domain/entity/nguonc_movie_item_entity.dart';
import 'package:smoth_movie_app/features/nguonc_search_movies/domain/usecase/nguonc_get_search_films.dart';

part 'nguonc_search_event.dart';
part 'nguonc_search_state.dart';
part 'nguonc_search_bloc.freezed.dart';

class NguoncSearchBloc extends Bloc<NguoncSearchEvent, NguoncSearchState> {
  final NguoncGetSearchFilms usecase;
  NguoncSearchBloc(this.usecase) : super(const NguoncSearchState()) {
    on<GetSearchFilmsEvent>((event, emit) async {
      if (state.isEnd) {
        emit(state.copyWith(status: SearchPageStatus.success, isEnd: false));
      }
      if (state.query != event.query) {
        emit(state.copyWith(
          status: SearchPageStatus.loading,
          page: 1,
          movies: const [],
        ));
      }
      final res = await usecase.call(
        NguoncGetSearchFilmsParams(query: event.query, page: state.page),
      );
      res.fold(
        (err) => emit(state.copyWith(status: SearchPageStatus.error)),
        (data) {
          if (data.length < 10) {
            emit(state.copyWith(
              status: SearchPageStatus.success,
              movies: state.query == event.query
                  ? [...state.movies, ...data]
                  : data,
              query: event.query,
              isEnd: true,
            ));
          } else {
            emit(state.copyWith(
              status: SearchPageStatus.success,
              movies: state.query == event.query
                  ? [...state.movies, ...data]
                  : data,
              query: event.query,
              page: state.page + 1,
            ));
          }
        },
      );
    });
  }
}
