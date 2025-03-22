import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smoth_movie_app/core/bloc/kho_phim/categories_state_status.dart';
import 'package:smoth_movie_app/core/bloc/kho_phim/countries_state_status.dart';
import 'package:smoth_movie_app/core/bloc/kho_phim/page_status.dart';
import 'package:smoth_movie_app/features/kho_phim/domain/entity/kho_phim_category_entity.dart';
import 'package:smoth_movie_app/features/kho_phim/domain/entity/kho_phim_country_entity.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/bloc/categories/category_list_bloc.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/bloc/countries/countries_bloc.dart';
import 'package:smoth_movie_app/helper/helper.dart';

part 'kho_phim_page_event.dart';
part 'kho_phim_page_state.dart';
part 'kho_phim_page_bloc.freezed.dart';

class KhoPhimPageBloc extends Bloc<KhoPhimPageEvent, KhoPhimPageState> {
  final CountriesBloc countriesBloc;
  final CategoryListBloc categoryListBloc;
  KhoPhimPageBloc({
    required this.countriesBloc,
    required this.categoryListBloc,
  }) : super(const KhoPhimPageState()) {
    on<KhoPhimLoadAllBlocEvent>((event, emit) async {
      emit(state.copyWith(status: KhoPhimPageStatus.loading));

      List<KhoPhimCountryEntity> countriesLoaded = [];
      List<KhoPhimCategoryEntity> categoriesLoaded = [];

      countriesBloc.stream.listen((countryState) {
        if (countryState.status == CountriesStateStatus.success) {
          countriesLoaded = countryState.countries;
        }
        countriesBloc.close();
      });
      categoryListBloc.stream.listen((categoryState) {
        if (categoryState.status == CategoriesStateStatus.success) {
          categoriesLoaded = categoryState.categories;
        }
        categoryListBloc.close();
      });
      await Future.wait([
        countriesBloc.stream.first,
        categoryListBloc.stream.first,
      ]);

      if (countriesLoaded.isNotEmpty && categoriesLoaded.isNotEmpty) {
        List<String> listOfYear = Helper.getYears();
        listOfYear.insert(0, "Tất cả các năm");
        List<String> listOfLanguageSub = [
          "thuyet-minh",
          "vietsub",
          "long-tieng"
        ];
        emit(state.copyWith(
          status: KhoPhimPageStatus.success,
          countries: countriesLoaded,
          categories: categoriesLoaded,
          years: listOfYear,
          langs: listOfLanguageSub,
        ));
      }
    });
  }
}
