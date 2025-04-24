part of 'movies_by_category_bloc.dart';

@freezed
abstract class MoviesByCategoryState with _$MoviesByCategoryState {
  const MoviesByCategoryState._();
  const factory MoviesByCategoryState([
    @Default(MoviesStateStatus.init) MoviesStateStatus status,
    @Default([]) List<NguoncMoviesByCategoryItemEntity> movies,
  ]) = _MoviesByCategoryState;
}