part of 'movies_bloc.dart';

@freezed
abstract class MoviesEvent with _$MoviesEvent {
  /// Home section: cache-first snapshot, first [MoviesBloc.previewItemLimit] items.
  const factory MoviesEvent.loadCategoryPreview({
    required String path,
  }) = LoadCategoryPreview;

  /// Category tab: initial feed, up to [MoviesBloc.feedPageLimit] items per page.
  const factory MoviesEvent.loadCategoryFeed({
    required String path,
  }) = LoadCategoryFeed;

  /// Category tab: append next page for the same [path].
  const factory MoviesEvent.loadMoreCategoryFeed({
    required String path,
  }) = LoadMoreCategoryFeed;
}
