part of 'movies_sort_by_time_bloc.dart';

@freezed
abstract class MoviesSortByTimeState with _$MoviesSortByTimeState {
  const MoviesSortByTimeState._();
  const factory MoviesSortByTimeState([
    @Default(MoviesSortByTimeStateStatus.init)
    MoviesSortByTimeStateStatus status,
    @Default([]) List<MovieItemEntity> movies,
  ]) = _MoviesSortByTimeState;
}
