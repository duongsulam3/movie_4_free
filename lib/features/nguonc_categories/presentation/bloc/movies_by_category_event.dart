part of 'movies_by_category_bloc.dart';

@immutable
sealed class MoviesByCategoryEvent {}

class GetMoviesByCategory extends MoviesByCategoryEvent {
  final String slug;
  final int page;
  GetMoviesByCategory({required this.slug, this.page = 1});
}
