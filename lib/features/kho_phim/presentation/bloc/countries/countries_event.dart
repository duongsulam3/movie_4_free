part of 'countries_bloc.dart';



@immutable
sealed class CountriesEvent {
  const CountriesEvent();
}

class GetAllCountry extends CountriesEvent {
  const GetAllCountry();
}
