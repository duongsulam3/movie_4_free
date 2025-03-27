part of 'similar_movies_bloc.dart';

@freezed
abstract class SimilarMoviesState with _$SimilarMoviesState {
  const  SimilarMoviesState._();
  const factory SimilarMoviesState([
    @Default(MoviesStateStatus.init) MoviesStateStatus status,
    @Default([]) List<MovieItemEntity> movies,
  ]) = _SimilarMoviesState;
}
