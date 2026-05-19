import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../common/utils/enum/recommend_movies/recommend_movies_state_status.dart';
import '../../../domain/entities/recommend_movie.dart';
import '../../../domain/usecase/get_recommend_movies.dart';

part 'recommend_movies_event.dart';
part 'recommend_movies_state.dart';
part 'recommend_movies_bloc.freezed.dart';

class RecommendMoviesBloc
    extends Bloc<RecommendMoviesEvent, RecommendMoviesState> {
  final GetRecommendMovies usecase;
  RecommendMoviesBloc({required this.usecase})
      : super(const RecommendMoviesState()) {
    on<GetRecommendMoviesEvent>(_onGetRecommendMoviesEvent);
  }

  Future<void> _onGetRecommendMoviesEvent(
    GetRecommendMoviesEvent event,
    Emitter<RecommendMoviesState> emit, {
    int limit = 12,
  }) async {
    emit(state.copyWith(status: RecommendMoviesStatus.loading));
    final res = await usecase.call();
    res.fold(
      (err) => emit(state.copyWith(status: RecommendMoviesStatus.error)),
      (movies) {
        final titles = List.generate(limit, (i) => movies[i].title);
        emit(state.copyWith(
          status: RecommendMoviesStatus.success,
          movies: movies,
          titles: titles,
        ));
      },
    );
  }
}
