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

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RecentlyUpdateMoviesBloc>(
          create: (_) => serviceLocator()..add(GetRecentlyUpdateMovies()),
        ),
        BlocProvider<HomeShellCubit>(
          create: (_) => HomeShellCubit(),
        ),
        BlocProvider<CountriesBloc>(
          create: (_) => serviceLocator(),
        ),
        BlocProvider<CategoryListBloc>(
          create: (_) => serviceLocator(),
        ),
        BlocProvider<KhoPhimPageBloc>(
          create: (context) => KhoPhimPageBloc(
            countriesBloc: context.read<CountriesBloc>(),
            categoryListBloc: context.read<CategoryListBloc>(),
          ),
        ),
      ],
      child: child,
    );
  }
}
