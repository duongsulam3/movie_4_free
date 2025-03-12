import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/features/movies/presentation/bloc/movies_bloc/movies_bloc.dart';
import 'package:smoth_movie_app/features/movies/presentation/screens/widgets/movies_widget.dart';
import 'package:smoth_movie_app/init_dependencies.dart';

class PhimLeTab extends StatelessWidget {
  const PhimLeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<MoviesBloc>()
        ..add(const GetListMovies(path: 'phim-le', limit: 18)),
      child: const MoviesList(path: 'phim-le'),
    );
  }
}
