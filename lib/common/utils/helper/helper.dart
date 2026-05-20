import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/bloc/categories/category_list_bloc.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/bloc/kho_phim_movies/kho_phim_movies_bloc.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/category.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/country.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/bloc/detail_movie/detail_movie_bloc.dart';
import 'package:smoth_movie_app/features/movies/presentation/bloc/similar_movies/similar_movies_bloc.dart';
import 'package:smoth_movie_app/features/search/data/models/search_suggestion_model.dart';
import 'package:smoth_movie_app/features/search/presentation/bloc/search_main_bloc/search_bloc.dart';
import 'package:smoth_movie_app/features/movies/presentation/bloc/movies/movies_bloc.dart';
import 'package:smoth_movie_app/common/utils/helper/http_override.dart';

class Helper {
  // ===== Core =====
  // Keep the existing global override entrypoint unchanged.
  static final myHttpOverrides = MyHttpOverrides();

  // ===== Feature: Search =====
  static void onSubmitSearch({
    required BuildContext context,
    required String query,
    int? limit,
  }) {
    if (query.isEmpty) return;
    context.read<SearchBloc>().add(GetSearchMoviesEvent(
          query: query,
          limit: limit ?? 10,
        ));
  }

  static void loadMoreSearch(BuildContext context, String query, int limit) {
    if (query.isEmpty) return;
    context.read<SearchBloc>().add(GetSearchMoviesEvent(
          query: query,
          limit: limit,
        ));
  }

  // ===== Feature: Movies (Infinite / Similar) =====
  static void loadMoreInfiniteMovies(BuildContext context, String path) {
    final moviesBloc = context.read<MoviesBloc>();
    moviesBloc.add(GetListMovies(path: path, limit: 30));
  }

  static void loadSimilarMovies(BuildContext context, String slug) {
    context.read<SimilarMoviesBloc>().add(FetchMovies(categorySlug: slug));
  }

  // ===== Feature: Kho Phim =====
  static void loadAllCategories(BuildContext context) {
    final cateBloc = context.read<CategoryListBloc>();
    cateBloc.add(const GetAllCategories());
  }

  static void loadKhoPhimMovies(
    BuildContext context,
    String countrySlug,
    String languageSlug,
    String categorySlug,
    String yearSlug,
    int limit,
  ) {
    context.read<KhoPhimMoviesBloc>().add(GetKhoPhimMoviesEvent(
          countrySlug: countrySlug,
          lang: languageSlug,
          categorySlug: categorySlug,
          year: yearSlug,
          limit: limit,
        ));
  }

  // ===== Feature: Movie Detail =====
  static void updateUrlEvent(
    BuildContext cxt,
    String url,
    String episode,
    String slug,
  ) {
    cxt.read<DetailMovieBloc>().add(UpdateVideoPlayerUrl(
          url: url,
          episode: episode,
          slug: slug,
        ));
  }

  // ===== Shared UI / Utility =====
  static List<String> getYears() {
    List<String> list = List.empty(growable: true);
    final dateTime = DateTime.now();
    for (int i = dateTime.year; i >= 1970; i--) {
      list.add(i.toString());
    }
    return list;
  }

  static void showInitPlayerErrorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        elevation: 0,
        duration: const Duration(seconds: 5),
        backgroundColor: Colors.black.withValues(alpha: 0.9),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        margin: const EdgeInsets.only(bottom: 20, left: 30, right: 30),
        content: const Row(
          spacing: 10,
          children: [
            FittedBox(child: Icon(CupertinoIcons.wifi_slash)),
            Expanded(
              child: ResponsiveText(
                text: "Lỗi khi tải dữ liệu phim!",
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ===== Display Mapping: Movie Detail / NguonC =====

  static String getCategories(List<CategoryEntity> categories) {
    return categories.map((e) => e.name).toList().join(", ");
  }

  static String getCountries(List<CountryEnity> countries) {
    return countries.map((e) => e.name).toList().join(", ");
  }

  // ===== Parsing: NguonC =====

  static List<SearchSuggestionModel> deduplicateSearchSuggestions(
    List<SearchSuggestionModel> suggestions,
  ) {
    // Keep only first occurrence by case-insensitive name.
    return suggestions.fold<List<SearchSuggestionModel>>(
      [],
      (previousValue, element) {
        final isDuplicated = previousValue.any(
          (item) => item.name.toLowerCase() == element.name.toLowerCase(),
        );
        if (!isDuplicated) previousValue.add(element);
        return previousValue;
      },
    );
  }
}
