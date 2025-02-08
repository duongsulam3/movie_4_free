import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/features/home/home_search/domain/entities/search_movie_entity.dart';
import 'package:smoth_movie_app/features/home/home_search/domain/usecase/get_search_movies.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetSearchMovies _getSearchMovies;
  SearchBloc({required GetSearchMovies getSearchMovies})
      : _getSearchMovies = getSearchMovies,
        super(const SearchInitial(movies: [])) {
    on<GetSearchMoviesEvent>((event, emit) async {
      final res = await _getSearchMovies.call(event.query);
      res.fold(
        (err) => emit(SearchErrorState(message: err.message)),
        (data) => emit(SearchSuccessState(movies: data)),
      );
    });
  }
}
