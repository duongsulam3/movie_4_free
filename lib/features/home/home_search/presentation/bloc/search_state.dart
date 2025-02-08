part of 'search_bloc.dart';

@immutable
sealed class SearchState {
  const SearchState();
}

final class SearchInitial extends SearchState {
  final List<SearchMovieEntity> movies;
  const SearchInitial({required this.movies});
}

final class SearchLoadingState extends SearchState {}

final class SearchErrorState extends SearchState {
  final String message;
  const SearchErrorState({required this.message});
}

final class SearchSuccessState extends SearchInitial {
  const SearchSuccessState({required super.movies});
}
