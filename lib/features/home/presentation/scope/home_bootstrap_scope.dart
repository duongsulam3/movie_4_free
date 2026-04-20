import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/core/init_dependencies.dart';
import 'package:smoth_movie_app/features/home/presentation/bloc/home_shell/home_shell_cubit.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/bloc/categories/category_list_bloc.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/bloc/countries/countries_bloc.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/bloc/kho_phim/kho_phim_page_bloc.dart';
import 'package:smoth_movie_app/features/movies/presentation/bloc/recently_update_movies/recently_update_movies_bloc.dart';

class HomeBootstrapScope extends StatelessWidget {
  const HomeBootstrapScope({
    super.key,
    required this.child,
  });

  final Widget child;

  RecentlyUpdateMoviesBloc _createRecentlyUpdateMoviesBloc() {
    return serviceLocator()..add(GetRecentlyUpdateMovies());
  }

  HomeShellCubit _createHomeShellCubit() {
    return HomeShellCubit();
  }

  CountriesBloc _createCountriesBloc() {
    return serviceLocator();
  }

  CategoryListBloc _createCategoryListBloc() {
    return serviceLocator();
  }

  KhoPhimPageBloc _createKhoPhimPageBloc(BuildContext context) {
    return KhoPhimPageBloc(
      countriesBloc: context.read<CountriesBloc>(),
      categoryListBloc: context.read<CategoryListBloc>(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RecentlyUpdateMoviesBloc>(
          create: (_) => _createRecentlyUpdateMoviesBloc(),
        ),
        BlocProvider<HomeShellCubit>(
          create: (_) => _createHomeShellCubit(),
        ),
        BlocProvider<CountriesBloc>(
          create: (_) => _createCountriesBloc(),
        ),
        BlocProvider<CategoryListBloc>(
          create: (_) => _createCategoryListBloc(),
        ),
        BlocProvider<KhoPhimPageBloc>(
          create: (context) => _createKhoPhimPageBloc(context),
        ),
      ],
      child: child,
    );
  }
}
