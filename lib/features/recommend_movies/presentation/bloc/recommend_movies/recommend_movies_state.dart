part of 'recommend_movies_bloc.dart';

@freezed
abstract class RecommendMoviesState with _$RecommendMoviesState {
  const RecommendMoviesState._();
  const factory RecommendMoviesState({
    @Default(RecommendMoviesStatus.init) RecommendMoviesStatus status,
    @Default([]) List<RecommendMovieEntity> movies,
    @Default([]) List<String> titles,
  }) = _RecommendMoviesState;
}
