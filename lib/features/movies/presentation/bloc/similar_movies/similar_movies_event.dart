part of 'similar_movies_bloc.dart';

@immutable
sealed class SimilarMoviesEvent {
  const SimilarMoviesEvent();
}

class FetchMovies extends SimilarMoviesEvent {
  final String categorySlug;
  const FetchMovies({required this.categorySlug});
}
