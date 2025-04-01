import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/features/movies/presentation/bloc/movies/movies_bloc.dart';
import 'package:smoth_movie_app/features/movies/presentation/bloc/movies_sortby_time/movies_sort_by_time_bloc.dart';
import 'package:smoth_movie_app/features/movies/presentation/screens/bloc_builder_movies_sort_by_time.dart';
import 'package:smoth_movie_app/features/movies/presentation/screens/infinite_gridview_widget.dart';
import 'package:smoth_movie_app/init_dependencies.dart';

class PhimBoTab extends StatelessWidget {
  const PhimBoTab({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final String path = 'phim-bo';
    final sHeight = MediaQuery.of(context).size.height;
    return MultiBlocProvider(
      providers: [
        BlocProvider<MoviesSortByTimeBloc>(
          create: (context) => serviceLocator()
            ..add(GetSortByTimeMovies(
              cateName: path,
              page: 1,
              sortfield: "modified.time",
            )),
        ),
        BlocProvider<MoviesBloc>(
          create: (context) => serviceLocator()
            ..add(GetListMovies(
              path: path,
              limit: 30,
            )),
        ),
      ],
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          spacing: sHeight / (sHeight / 20),
          children: [
            const BlocBuilderMoviesSortByTime(),
            InfiniteGridView(path: path),
          ],
        ),
      ),
    );
  }
}
