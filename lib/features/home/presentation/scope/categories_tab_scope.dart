import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/di/init_dependencies.dart';
import 'package:smoth_movie_app/features/movies/presentation/bloc/movies/movies_bloc.dart';
import 'package:smoth_movie_app/features/movies/presentation/bloc/movies_sortby_time/movies_sort_by_time_bloc.dart';

class CategoriesTabScope extends StatelessWidget {
  const CategoriesTabScope({
    super.key,
    required this.path,
    required this.limit,
    required this.child,
  });

  final String path;
  final int limit;
  final Widget child;

  MoviesSortByTimeBloc _createMoviesSortByTimeBloc() {
    return serviceLocator()
      ..add(GetSortByTimeMovies(
        cateName: path,
        page: 1,
        sortfield: "modified.time",
      ));
  }

  MoviesBloc _createMoviesBloc() {
    return serviceLocator()
      ..add(GetListMovies(
        path: path,
        limit: limit,
      ));
  }

  @override
  Widget build(BuildContext context) {
    // Category tab data is isolated per tab path.
    return MultiBlocProvider(
      providers: [
        BlocProvider<MoviesSortByTimeBloc>(
          create: (_) => _createMoviesSortByTimeBloc(),
        ),
        BlocProvider<MoviesBloc>(
          create: (_) => _createMoviesBloc(),
        ),
      ],
      child: child,
    );
  }
}
