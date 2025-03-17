import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/features/movies/presentation/bloc/movies_bloc/movies_bloc.dart';
import 'package:smoth_movie_app/features/movies/presentation/screens/infinite_gridview_widget.dart';
import 'package:smoth_movie_app/init_dependencies.dart';

class PhimBoTab extends StatelessWidget {
  const PhimBoTab({super.key});

  @override
  Widget build(BuildContext context) {
    // return const Center(child: Text("phim-bo"));
    return BlocProvider(
      create: (context) => serviceLocator<MoviesBloc>()
        ..add(const GetListMovies(path: 'phim-bo', limit: 18)),
      child: const InfiniteGridView(path: 'phim-bo'),
    );
  }
}
