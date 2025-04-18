part of 'nguonc_movie_detail_bloc.dart';

@immutable
sealed class NguoncMovieDetailEvent {
  const NguoncMovieDetailEvent();
}

class GetNguoncMovieDetailEvent extends NguoncMovieDetailEvent {
  final String slug;
  const GetNguoncMovieDetailEvent({required this.slug});
}

class UpdateWebViewPlayerUrlEvent extends NguoncMovieDetailEvent {
  final String url;
  final String episode;
  const UpdateWebViewPlayerUrlEvent({required this.url, required this.episode});
}
