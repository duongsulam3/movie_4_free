part of 'list_movie_item_bloc.dart';

enum MovieStatus { initial, success, failure }

@immutable
sealed class ListMovieItemBlocState {
  const ListMovieItemBlocState();
}

final class ListMovieItemBlocInitial extends ListMovieItemBlocState {
  final List list;
  const ListMovieItemBlocInitial({required this.list});
}

final class GetListRecentlyUpdateMovieStateSuccess
    extends ListMovieItemBlocState {
  final List<RecentlyUpdateListItemEntity> movies;
  const GetListRecentlyUpdateMovieStateSuccess({
    required this.movies,
  });
}

final class GetListRecentlyUpdateMovieStateError
    extends ListMovieItemBlocState {
  final String message;
  const GetListRecentlyUpdateMovieStateError({
    required this.message,
  });
}

final class GetListAnimeMovieSuccess extends ListMovieItemBlocState {
  final List<MovieItemEntity> movies;
  const GetListAnimeMovieSuccess({required this.movies});
}

final class GetListAnimeMovieError extends ListMovieItemBlocState {
  final String message;
  const GetListAnimeMovieError({required this.message});
}

final class GetListSingleMovieSuccess extends ListMovieItemBlocState {
  final List<MovieItemEntity> movies;
  const GetListSingleMovieSuccess({required this.movies});
}

final class GetListSingleMovieError extends ListMovieItemBlocState {
  final String message;
  const GetListSingleMovieError({required this.message});
}

final class GetTvShowsSuccess extends ListMovieItemBlocState {
  final List<MovieItemEntity> movies;
  const GetTvShowsSuccess({required this.movies});
}

final class GetTvShowsError extends ListMovieItemBlocState {
  final String message;
  const GetTvShowsError({required this.message});
}

final class GetSeriesMovieSuccess extends ListMovieItemBlocState {
  final List<MovieItemEntity> movies;
  const GetSeriesMovieSuccess({required this.movies});
}

final class GetSeriesMovieError extends ListMovieItemBlocState {
  final String message;
  const GetSeriesMovieError({required this.message});
}
