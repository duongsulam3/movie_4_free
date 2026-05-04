import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/di/init_dependencies.dart';
import 'package:smoth_movie_app/features/movies/presentation/bloc/movies/movies_bloc.dart';

class TitleGridMoviesScope extends StatelessWidget {
  const TitleGridMoviesScope({
    super.key,
    required this.path,
    required this.limit,
    required this.child,
  });

  final String path;
  final int limit;
  final Widget child;

  MoviesBloc _createMoviesBloc() {
    return serviceLocator()
      ..add(GetListMovies(
        path: path,
        limit: limit,
        isRefresh: false,
      ));
  }

  @override
  Widget build(BuildContext context) {
    // Home section grid keeps its own movie state by section path.
    return BlocProvider<MoviesBloc>(
      create: (_) => _createMoviesBloc(),
      child: child,
    );
  }
}
