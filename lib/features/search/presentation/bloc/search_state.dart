part of 'search_bloc.dart';

@freezed
abstract class SearchState with _$SearchState {
  const SearchState._();
  const factory SearchState([
    @Default(SearchPageStatus.init) SearchPageStatus status,
    @Default(1) int page,
    @Default("") String query,
    @Default([]) List<MovieItemEntity> movies,
    @Default(false) bool isEnd,
  ]) = _SearchState;
}