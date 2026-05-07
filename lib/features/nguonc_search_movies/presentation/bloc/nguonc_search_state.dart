part of 'nguonc_search_bloc.dart';

@freezed
abstract class NguoncSearchState with _$NguoncSearchState {
  const NguoncSearchState._();
  const factory NguoncSearchState([
    @Default(SearchPageStatus.init) SearchPageStatus status,
    @Default(1) int page,
    @Default("") String query,
    @Default([]) List<NguoncMovieItemEntity> movies,
    @Default(false) bool isEnd,
    @Default("") String typingQuery,
    @Default([]) List<NguoncSearchSuggestionEntity> suggestions,
    @Default(false) bool isSuggestionLoading,
  ]) = _NguoncSearchState;
}
