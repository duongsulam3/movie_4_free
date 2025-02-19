part of 'movies_bloc.dart';

@immutable
sealed class MoviesBlocEvent {
  const MoviesBlocEvent();
}

final class MovieBlocEventFetch extends MoviesBlocEvent {
  final int page;
  const MovieBlocEventFetch({required this.page});
}
