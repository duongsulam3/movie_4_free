import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'kho_phim_filter_event.dart';
part 'kho_phim_filter_state.dart';
part 'kho_phim_filter_bloc.freezed.dart';

class KhoPhimFilterBloc extends Bloc<KhoPhimFilterEvent, KhoPhimFilterState> {
  KhoPhimFilterBloc() : super(const KhoPhimFilterState()) {
    on<InitializeKhoPhimFilters>(_onInitialize);
    on<CountrySelected>(_onCountrySelected);
    on<CategorySelected>(_onCategorySelected);
    on<YearSelected>(_onYearSelected);
    on<LanguageSelected>(_onLanguageSelected);
  }

  void _onInitialize(
    InitializeKhoPhimFilters event,
    Emitter<KhoPhimFilterState> emit,
  ) {
    if (state.isInitialized) return;

    emit(state.copyWith(
      countrySlug: event.defaultCountrySlug,
      isInitialized: true,
    ));
  }

  void _onCountrySelected(
    CountrySelected event,
    Emitter<KhoPhimFilterState> emit,
  ) {
    if (state.countrySlug == event.slug) return;
    emit(state.copyWith(countrySlug: event.slug));
  }

  void _onCategorySelected(
    CategorySelected event,
    Emitter<KhoPhimFilterState> emit,
  ) {
    if (state.categorySlug == event.slug) return;
    emit(state.copyWith(categorySlug: event.slug));
  }

  void _onYearSelected(
    YearSelected event,
    Emitter<KhoPhimFilterState> emit,
  ) {
    if (state.yearSlug == event.slug) return;
    emit(state.copyWith(yearSlug: event.slug));
  }

  void _onLanguageSelected(
    LanguageSelected event,
    Emitter<KhoPhimFilterState> emit,
  ) {
    if (state.languageSlug == event.slug) return;
    emit(state.copyWith(languageSlug: event.slug));
  }
}
