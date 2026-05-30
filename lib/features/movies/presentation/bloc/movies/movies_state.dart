part of 'movies_bloc.dart';

@freezed
abstract class MoviesState with _$MoviesState {
  const MoviesState._();
  const factory MoviesState({
    @Default(MoviesStateStatus.init) MoviesStateStatus status,
    @Default(1) int page,
    @Default([]) List<MovieItemEntity> movies,
    @Default(false) bool isEnd,
    @Default('') String categoryPath,
    @Default(false) bool isLoadingMore,
    @Default(false) bool loadMoreFailed,
  }) = _MoviesState;
}
