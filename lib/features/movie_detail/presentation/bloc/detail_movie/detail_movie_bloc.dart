import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smoth_movie_app/core/utils/enum/detail_movie/detail_movie_status.dart';
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
    on<GetMovieDetailEvent>((event, emit) async {
      final res = await _getDetailMovie.call(
        GetDetailMovieParams(slug: event.slug),
      );
      res.fold(
        (err) => emit(state.copyWith(status: DetailMovieStatus.error)),
        (data) {
          emit(state.copyWith(
            status: DetailMovieStatus.success,
            movie: data,
            passingUrl: data.episodes[0].serverData[0].linkM3U8,
            passingEpisode: data.episodes[0].serverData[0].name,
          ));
        },
      );
    });

    on<UpdateVideoPlayerUrl>((event, emit) {
      emit(state.copyWith(
        passingUrl: event.url,
        passingEpisode: event.episode,
      ));
    });
  }
}
