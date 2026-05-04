import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smoth_movie_app/common/core/utils/enum/detail_movie/detail_movie_status.dart';
//! DOMAIN
import 'package:smoth_movie_app/features/movie_detail/domain/entities/movie_detail.dart';
//! USECASE
import 'package:smoth_movie_app/features/movie_detail/domain/usecase/get_detail_movie.dart';

part 'detail_movie_event.dart';
part 'detail_movie_state.dart';
part 'detail_movie_bloc.freezed.dart';

class DetailMovieBloc extends Bloc<DetailMovieEvent, DetailMovieState> {
  final GetDetailMovie _getDetailMovie;
  DetailMovieBloc({required GetDetailMovie getDetailMovie})
      : _getDetailMovie = getDetailMovie,
        super(const DetailMovieState()) {
    on<GetMovieDetailEvent>(_onGetMovieDetail);
    on<UpdateVideoPlayerUrl>(_onUpdateVideoPlayerUrl);
  }

  Future<void> _onGetMovieDetail(
    GetMovieDetailEvent event,
    Emitter<DetailMovieState> emit,
  ) async {
    final res = await _getDetailMovie.call(
      GetDetailMovieParams(slug: event.slug),
    );

    // Keep success/error transitions explicit for easier review.
    res.fold(
      (_) => _emitGetMovieDetailError(emit),
      (data) => _emitGetMovieDetailSuccess(emit, data),
    );
  }

  void _emitGetMovieDetailError(Emitter<DetailMovieState> emit) {
    emit(state.copyWith(status: DetailMovieStatus.error));
  }

  void _emitGetMovieDetailSuccess(
    Emitter<DetailMovieState> emit,
    MovieDetailEntity movie,
  ) {
    emit(state.copyWith(
      status: DetailMovieStatus.success,
      movie: movie,
      passingEpisode: movie.episodes[0].serverData[0].name,
      passingSlug: movie.episodes[0].serverData[0].slug,
    ));
  }

  void _onUpdateVideoPlayerUrl(
    UpdateVideoPlayerUrl event,
    Emitter<DetailMovieState> emit,
  ) {
    emit(state.copyWith(
      passingUrl: event.url,
      passingEpisode: event.episode,
      passingSlug: event.slug,
    ));
  }
}
