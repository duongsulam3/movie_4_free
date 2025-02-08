part of 'detail_page_bloc.dart';

@immutable
sealed class DetailPageEvent {
  const DetailPageEvent();
}

final class SetNewVideoPlayer extends DetailPageEvent {
  final String newUrl;
  final String newEpisode;
  const SetNewVideoPlayer({required this.newUrl, required this.newEpisode});
}