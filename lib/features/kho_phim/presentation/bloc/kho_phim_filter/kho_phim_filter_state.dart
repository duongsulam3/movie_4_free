part of 'kho_phim_filter_bloc.dart';

@freezed
abstract class KhoPhimFilterState with _$KhoPhimFilterState {
  const factory KhoPhimFilterState({
    @Default('') String countrySlug,
    @Default('') String categorySlug,
    @Default('0') String yearSlug,
    @Default('vietsub') String languageSlug,
    @Default(false) bool isInitialized,
  }) = _KhoPhimFilterState;
}
