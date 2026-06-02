part of 'kho_phim_filter_bloc.dart';

@freezed
abstract class KhoPhimFilterEvent with _$KhoPhimFilterEvent {
  const factory KhoPhimFilterEvent.initialize({
    required String defaultCountrySlug,
  }) = InitializeKhoPhimFilters;

  const factory KhoPhimFilterEvent.countrySelected(
    String slug,
  ) = CountrySelected;

  const factory KhoPhimFilterEvent.categorySelected(
    String slug,
  ) = CategorySelected;

  const factory KhoPhimFilterEvent.yearSelected(
    String slug,
  ) = YearSelected;

  const factory KhoPhimFilterEvent.languageSelected(
    String slug,
  ) = LanguageSelected;
}
