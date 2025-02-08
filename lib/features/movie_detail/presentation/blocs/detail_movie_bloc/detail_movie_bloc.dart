import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//! DOMAIN
import 'package:smoth_movie_app/features/movie_detail/domain/entities/movie_detail.dart';
//! USECASE
import 'package:smoth_movie_app/features/movie_detail/domain/usecase/get_detail_movie.dart';

part 'detail_movie_event.dart';
part 'detail_movie_state.dart';

class DetailMovieBloc extends Bloc<DetailMovieEvent, DetailMovieState> {
  final GetDetailMovie _getDetailMovie;
  DetailMovieBloc({
    required GetDetailMovie getDetailMovie,
  })  : _getDetailMovie = getDetailMovie,
        super(const DetailMovieInitial(movieDetail: null)) {
    on<DetailMovieEvent>((event, emit) => emit(MovieLoadingState()));
    on<GetMovieDetailEvent>(_getDetailDetailMovieBlocEvent);
  }

  _getDetailDetailMovieBlocEvent(
    GetMovieDetailEvent event,
    Emitter<DetailMovieState> emit,
  ) async {
    final res = await _getDetailMovie.call(
      GetDetailMovieParams(slug: event.slug),
    );
    res.fold(
      (error) => emit(GetMovieDetailStateError(message: error.message)),
      (movie) => emit(GetMovieDetailStateSuccess(movieDetail: movie)),
    );
  }
}
