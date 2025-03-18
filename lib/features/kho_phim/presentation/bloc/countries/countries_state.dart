part of 'countries_bloc.dart';

@freezed
abstract class CountriesState with _$CountriesState {
  const CountriesState._();
  const factory CountriesState([
    @Default(CountriesStateStatus.init) CountriesStateStatus status,
    @Default([]) List<KhoPhimCountryEntity> countries,
  ]) = _CountriesState;
}