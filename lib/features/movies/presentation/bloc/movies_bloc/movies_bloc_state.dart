part of 'movies_bloc.dart';

enum MovieStatus { initial, success, failure }

final class MoviesBlocState {
  final MovieStatus status;
  final int page;
  final List<MovieItemEntity> movies;
  final bool hasReachedMax;
  const MoviesBlocState({
    this.status = MovieStatus.initial,
    this.page = 1,
    this.movies = const <MovieItemEntity>[],
    this.hasReachedMax = false,
  });

  MoviesBlocState copyWith({
    MovieStatus? status,
    int? page,
    List<MovieItemEntity>? movies,
    bool? hasReachedMax,
  }) {
    return MoviesBlocState(
      status: status ?? this.status,
      page: page ?? this.page,
      movies: movies ?? this.movies,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}
