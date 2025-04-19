import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smoth_movie_app/core/utils/enum/detail_movie/detail_movie_status.dart';
import 'package:smoth_movie_app/features/nguonc_movie_detail/domain/entity/nguonc_movie_entity.dart';
import 'package:smoth_movie_app/features/nguonc_movie_detail/domain/usecase/get_nguonc_movie_detail.dart';

part 'nguonc_movie_detail_event.dart';
part 'nguonc_movie_detail_state.dart';
part 'nguonc_movie_detail_bloc.freezed.dart';

class NguoncMovieDetailBloc
    extends Bloc<NguoncMovieDetailEvent, NguoncMovieDetailState> {
  final GetNguoncMovieDetail usecase;
  NguoncMovieDetailBloc(this.usecase) : super(const NguoncMovieDetailState()) {
    on<GetNguoncMovieDetailEvent>((event, emit) async {
      final res = await usecase.call(GetNguoncMovieDetailParams(
        slug: event.slug,
      ));
      res.fold(
        (err) => emit(state.copyWith(status: DetailMovieStatus.error)),
        (data) {
          emit(state.copyWith(
            status: DetailMovieStatus.success,
            movie: data,
            passingUrl: data.episodes[0].items[0].embed,
            passingEpisode: data.episodes[0].items[0].name,
          ));
        },
      );
    });

    on<UpdateWebViewPlayerUrlEvent>(
      (event, emit) => emit(state.copyWith(
        passingUrl: event.url,
        passingEpisode: event.episode,
      )),
    );
  }
}
