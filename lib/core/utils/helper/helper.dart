import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';
import 'package:smoth_movie_app/features/kho_phim/data/model/kho_phim_category_model.dart';
import 'package:smoth_movie_app/features/kho_phim/data/model/kho_phim_country_model.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/bloc/categories/category_list_bloc.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/bloc/kho_phim_movies/kho_phim_movies_bloc.dart';
import 'package:smoth_movie_app/features/movie_detail/data/model/movie_detail.dart';
import 'package:smoth_movie_app/features/movies/data/model/recently_update_movies/recently_update_list_item_model.dart';
import 'package:smoth_movie_app/features/movies/data/model/single_movies/movie_item_model.dart';
import 'package:smoth_movie_app/features/nguonc_movies/data/model/nguonc_movie_item_model.dart';
import 'package:smoth_movie_app/features/nguonc_movies/presentation/bloc/nguonc_search_bloc.dart';
import 'package:smoth_movie_app/features/search/presentation/bloc/search_bloc.dart';
import 'package:smoth_movie_app/features/home/presentation/bloc/bottom_nav/bottom_nav_bloc.dart';
import 'package:smoth_movie_app/features/movies/presentation/bloc/movies/movies_bloc.dart';
import 'package:smoth_movie_app/core/utils/helper/http_override.dart';

class Helper {
  //** HTTP OVERRIDE WITH BAD CERTIFICATION */
  static final myHttpOverrides = MyHttpOverrides();
  //** HTTP OVERRIDE WITH BAD CERTIFICATION */

  //** BLOC FUNCTIONS */
  //! BOTTOM NAV BLOC
  static void changeBottomNavIndex(BuildContext context, int index) {
    context.read<BottomNavBloc>().add(HomeChangeBottomNavStateEvent(index));
  }

  //! SEARCH BLOC
  static void onSubmitSearch(BuildContext context, String query, int limit) {
    if (query.isEmpty) return;
    context.read<SearchBloc>().add(GetSearchMoviesEvent(
          query: query,
          limit: limit,
        ));
  }

  static void loadMoreSearch(BuildContext context, String query, int limit) {
    if (query.isEmpty) return;
    context.read<SearchBloc>().add(GetSearchMoviesEvent(
          query: query,
          limit: limit,
        ));
  }

  static void nguonCSearchFilms(BuildContext context, String query) {
    if (query.isEmpty) return;
    context.read<NguoncSearchBloc>().add(GetSearchFilmsEvent(query: query));
  }

  //! INFINITE MOVIES BLOC
  static void loadMoreInfiniteMovies(BuildContext context, String path) {
    final moviesBloc = context.read<MoviesBloc>();
    moviesBloc.add(GetListMovies(path: path, limit: 30));
  }

  //! CATEGORIES BLOC
  static void loadAllCategories(BuildContext context) {
    final cateBloc = context.read<CategoryListBloc>();
    cateBloc.add(const GetAllCategories());
  }

  //! KHO PHIM BLOC
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
  //** BLOC FUNCTIONS */

  //** FUNCTIONS */
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

  //! KHO PHIM -> COUNTRIES
  static List<KhoPhimCountryModel> parseKhoPhimCoutryJsonToList(String json) {
    final jsonResponse = jsonDecode(json) as List;
    return jsonResponse.map((e) => KhoPhimCountryModel.fromJson(e)).toList();
  }

  //! KHO PHIM -> CATEGORIES
  static List<KhoPhimCategoryModel> parseKhoPhimCateJsonToList(String json) {
    List<KhoPhimCategoryModel> cate = const [];
    final jsonResponse = jsonDecode(json) as List;
    cate = jsonResponse.map((e) => KhoPhimCategoryModel.fromJson(e)).toList();
    cate.insert(
      0,
      KhoPhimCategoryModel(
        id: "0",
        name: "Tất cả thể loại",
        slug: "",
      ),
    );
    return cate;
  }

  //! KHO PHIM MOVIES
  static List<MovieItemModel> parseKhoPhimMovies(String json) {
    final jsonResponse = jsonDecode(json)["data"]["items"] as List;
    return jsonResponse.map((e) => MovieItemModel.fromJson(e)).toList();
  }

  //! MOVIES
  static List<MovieItemModel> parseMovies(String json) {
    final jsonResponse = jsonDecode(json)["data"]["items"] as List;
    return jsonResponse.map((e) => MovieItemModel.fromJson(e)).toList();
  }

  //! RECENTLY UPDATED MOVIES
  static List<RecentlyUpdateListItemModel> parseRecentlyMovies(String json) {
    final jsonResponse = jsonDecode(json)['items'] as List;
    return jsonResponse
        .map((e) => RecentlyUpdateListItemModel.fromJson(e))
        .toList();
  }

  //! NGUỒN C SEARCH
  static List<NguoncMovieItemModel> parseNguoncSearchMovies(String json) {
    final jsonResponse = jsonDecode(json)['items'] as List;
    return jsonResponse.map((e) => NguoncMovieItemModel.fromJson(e)).toList();
  }

  //! MOVIE DETAIL
  static MovieDetailModel parseMovieDetail(String json) {
    final jsonResponse = jsonDecode(json);
    return MovieDetailModel.fromJson(jsonResponse);
  }
  //** FUNCTIONS */
}
