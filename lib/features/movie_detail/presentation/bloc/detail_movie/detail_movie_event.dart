part of 'detail_movie_bloc.dart';

@immutable
sealed class DetailMovieEvent {
  const DetailMovieEvent();
}

class GetMovieDetailEvent extends DetailMovieEvent {
  final String slug;
  const GetMovieDetailEvent({required this.slug});
}

class UpdateVideoPlayerUrl extends DetailMovieEvent {
  final String url;
  final String episode;
  const UpdateVideoPlayerUrl({required this.url, required this.episode});
}
