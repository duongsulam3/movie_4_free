part of 'nguonc_movie_detail_bloc.dart';

@immutable
sealed class NguoncMovieDetailEvent {
  const NguoncMovieDetailEvent();
}

class GetNguoncMovieDetailEvent extends NguoncMovieDetailEvent {
  final String slug;
  const GetNguoncMovieDetailEvent({required this.slug});
}
