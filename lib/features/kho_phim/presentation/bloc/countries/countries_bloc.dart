import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smoth_movie_app/core/bloc/countries_state_status.dart';
import 'package:smoth_movie_app/features/kho_phim/domain/entity/kho_phim_country_entity.dart';
import 'package:smoth_movie_app/features/kho_phim/domain/usecase/get_countries.dart';

part 'countries_event.dart';
part 'countries_state.dart';
part 'countries_bloc.freezed.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  final GetCountries getCountries;
  CountriesBloc(this.getCountries) : super(const CountriesState()) {
    on<GetAllCountry>((event, emit) async {
      emit(state.copyWith(status: CountriesStateStatus.loading));
      List<KhoPhimCountryEntity> countries = const [];
      final res = await getCountries.call();
      res.fold(
        (err) => emit(state.copyWith(status: CountriesStateStatus.error)),
        (data) {
          countries = data;
          emit(state.copyWith(
            status: CountriesStateStatus.success,
            countries: countries,
          ));
        },
      );
    });
  }
}
