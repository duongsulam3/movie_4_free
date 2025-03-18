import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/bloc/categories/category_list_bloc.dart';
import 'package:smoth_movie_app/features/search/presentation/bloc/search_bloc.dart';
import 'package:smoth_movie_app/features/home/presentation/bloc/bottom_nav/bottom_nav_bloc.dart';
import 'package:smoth_movie_app/features/movies/presentation/bloc/movies_bloc/movies_bloc.dart';
import 'package:smoth_movie_app/helper/http_override.dart';

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
  static void onSubmitSearch(BuildContext context, String query) {
    if (query.isEmpty) return;
    context.read<SearchBloc>().add(GetSearchMoviesEvent(query));
  }

  static void loadMoreSearch(BuildContext context, String query) {
    if (query.isEmpty) return;
    context.read<SearchBloc>().add(GetSearchMoviesEvent(query));
  }

  //! INFINITE MOVIES BLOC
  static void loadMoreInfiniteMovies(BuildContext context, String path) {
    final moviesBloc = context.read<MoviesBloc>();
    moviesBloc.add(GetListMovies(path: path, limit: 18));
  }

  //! CATEGORIES BLOC
  static void loadAllCategories(BuildContext context) {
    final cateBloc = context.read<CategoryListBloc>();
    cateBloc.add(const GetAllCategories());
  }
  //** BLOC FUNCTIONS */

  //** FUNCTIONS */
  static List<int> getYears() {
    List<int> list = List.empty(growable: true);
    final dateTime = DateTime.now();
    for (int i = dateTime.year; i >= 1970; i--) {
      list.add(i);
    }
    return list;
  }
  //** FUNCTIONS */
}
