import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/screens/loading_page.dart';
import 'package:smoth_movie_app/core/utils/enum/kho_phim/page_status.dart';
import 'package:smoth_movie_app/common/screens/error_page.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/bloc/categories/category_list_bloc.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/bloc/countries/countries_bloc.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/bloc/kho_phim/kho_phim_page_bloc.dart';
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
    context.read<KhoPhimPageBloc>().add(const KhoPhimLoadAllBlocEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<KhoPhimPageBloc, KhoPhimPageState>(
      builder: (context, state) {
        switch (state.status) {
          case KhoPhimPageStatus.init:
            return const SizedBox.shrink();
          case KhoPhimPageStatus.loading:
            return const LoadingPage();
          case KhoPhimPageStatus.error:
            return const ErrorPage();
          case KhoPhimPageStatus.success:
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  spacing: sHeight / (sHeight / 20),
                  children: [
                    const TitleAndSearchIcon(),
                    KhoPhimCountries(
                      countries: state.countries,
                      onSelected: (value) {
                        if (countrySlug == value) return;
                        Future.delayed(Duration.zero, () {
                          setState(() {
                            countrySlug = value;
                          });
                        });
                      },
                    ),
                    KhoPhimCategoriesWidget(
                      categories: state.categories,
                      onSelected: (value) {
                        if (categorySlug == value) return;
                        Future.delayed(Duration.zero, () {
                          setState(() {
                            categorySlug = value;
                          });
                        });
                      },
                    ),
                    KhoPhimYearsWidget(
                      years: state.years,
                      onSelected: (value) {
                        if (yearSlug == value) return;
                        Future.delayed(Duration.zero, () {
                          setState(() {
                            yearSlug = value;
                          });
                        });
                      },
                    ),
                    KhoPhimLanguageSubWidget(
                      langs: state.langs,
                      onSelected: (value) {
                        if (languageSlug == value) return;
                        Future.delayed(Duration.zero, () {
                          setState(() {
                            languageSlug = value;
                          });
                        });
                      },
                    ),
                    if (countrySlug.isNotEmpty)
                      BlocProvider(
                        create: (context) =>
                            serviceLocator<KhoPhimMoviesBloc>(),
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
      },
    );
  }
}
