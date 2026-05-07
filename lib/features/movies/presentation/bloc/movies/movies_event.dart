part of 'movies_bloc.dart';

@immutable
sealed class MoviesEvent {
  const MoviesEvent();
}

class GetListMovies extends MoviesEvent {
  final String path;
  final int limit;
  final bool isRefresh;
  final bool preferCacheFirst;
  const GetListMovies({
    required this.path,
    this.isRefresh = true,
    this.limit = 10,
    this.preferCacheFirst = false,
  });
}
