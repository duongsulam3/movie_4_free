import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/bloc/categories/category_list_bloc.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/bloc/countries/countries_bloc.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/bloc/kho_phim_movies/kho_phim_movies_bloc.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/widget/kho_phim_categories_widget.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/widget/kho_phim_countries_widget.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/widget/kho_phim_infinite_gridview_widget.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/widget/kho_phim_language_sub_widget.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/widget/kho_phim_years_widget.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/widget/title_and_search_icon.dart';
import 'package:smoth_movie_app/init_dependencies.dart';

class KhoPhimPage extends StatefulWidget {
  const KhoPhimPage({super.key});

  @override
  State<KhoPhimPage> createState() => _KhoPhimPageState();
}

class _KhoPhimPageState extends State<KhoPhimPage> {
  String categorySlug = "";
  String countrySlug = "";
  String yearSlug = "";
  String languageSlug = "";

  @override
  void initState() {
    context.read<CountriesBloc>().add(const GetAllCountry());
    context.read<CategoryListBloc>().add(const GetAllCategories());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          spacing: 20,
          children: [
            const TitleAndSearchIcon(),
            KhoPhimCountries(onSelected: (value) {
              if (countrySlug == value) return;
              setState(() {
                countrySlug = value;
                log("Country Slug: $countrySlug");
              });
            }),
            KhoPhimCategoriesWidget(onSelected: (value) {
              if (categorySlug == value) return;
              setState(() {
                categorySlug = value;
                log("Category Slug: $categorySlug");
              });
            }),
            KhoPhimYearsWidget(onSelected: (value) {
              if (yearSlug == value) return;
              Future.delayed(Duration.zero, () {
                setState(() {
                  yearSlug = value;
                  log("Year Slug: $yearSlug");
                });
              });
            }),
            KhoPhimLanguageSubWidget(onSelected: (value) {
              if (languageSlug == value) return;
              Future.delayed(Duration.zero, () {
                setState(() {
                  languageSlug = value;
                  log("Language Slug: $languageSlug");
                });
              });
            }),
            if (countrySlug.isNotEmpty && categorySlug.isNotEmpty)
              BlocProvider(
                create: (context) => serviceLocator<KhoPhimMoviesBloc>(),
                child: InfiniteGridViewMovies(
                  categorySlug: categorySlug,
                  countrySlug: countrySlug,
                  yearSlug: yearSlug,
                  languageSlug: languageSlug,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
