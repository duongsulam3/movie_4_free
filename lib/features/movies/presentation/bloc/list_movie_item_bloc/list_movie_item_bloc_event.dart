part of 'list_movie_item_bloc.dart';

@immutable
sealed class ListMovieItemBlocEvent {}

class GetRecentlyUpdateMovieList extends ListMovieItemBlocEvent {}

class GetAnimeMovieList extends ListMovieItemBlocEvent {}

class GetSingleMovieList extends ListMovieItemBlocEvent {}

class GetTvShowsList extends ListMovieItemBlocEvent {}

class GetSeriesMovieList extends ListMovieItemBlocEvent {}
