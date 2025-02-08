import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'detail_page_event.dart';
part 'detail_page_state.dart';

class DetailPageBloc extends Bloc<DetailPageEvent, DetailPageState> {
  DetailPageBloc()
      : super(const DetailPageInitial(newUrl: '', newEpisode: '')) {
    on<SetNewVideoPlayer>(
      (event, emit) => emit(
        DetailPageStateSuccess(
          newUrl: event.newUrl,
          newEpisode: event.newEpisode,
        ),
      ),
    );
  }
}
