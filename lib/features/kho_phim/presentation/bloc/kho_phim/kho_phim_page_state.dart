part of 'kho_phim_page_bloc.dart';

@freezed
abstract class KhoPhimPageState with _$KhoPhimPageState {
  const KhoPhimPageState._();
  const factory KhoPhimPageState([
    @Default(KhoPhimPageStatus.init) KhoPhimPageStatus status,
    @Default([]) List<KhoPhimCountryEntity> countries,
    @Default([]) List<KhoPhimCategoryEntity> categories,
    @Default([]) List<String> years,
    @Default([]) List<String> langs,
  ]) = _KhoPhimPageState;
}