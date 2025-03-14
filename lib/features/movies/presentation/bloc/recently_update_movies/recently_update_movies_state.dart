part of 'recently_update_movies_bloc.dart';

@freezed
abstract class RecentlyUpdateMoviesState with _$RecentlyUpdateMoviesState {
  const RecentlyUpdateMoviesState._();
  const factory RecentlyUpdateMoviesState([
    @Default(MoviesStateStatus.init) MoviesStateStatus status,
    @Default(1) int page,
    @Default([]) List<RecentlyUpdateListItemEntity> movies,
  ]) = _RecentlyUpdateMoviesState;
}
