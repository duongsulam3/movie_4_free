part of 'detail_page_bloc.dart';

@immutable
sealed class DetailPageState {
  final String newUrl;
  final String newEpisode;
  const DetailPageState({required this.newUrl, required this.newEpisode});
}

final class DetailPageInitial extends DetailPageState {
  const DetailPageInitial({required super.newUrl, required super.newEpisode});
}

final class DetailPageStateSuccess extends DetailPageState {
  const DetailPageStateSuccess({
    required super.newUrl,
    required super.newEpisode,
  });
}
