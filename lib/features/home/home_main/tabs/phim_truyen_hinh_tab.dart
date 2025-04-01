import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/features/movies/presentation/bloc/movies/movies_bloc.dart';
import 'package:smoth_movie_app/features/movies/presentation/bloc/recently_update_movies/recently_update_movies_bloc.dart';
import 'package:smoth_movie_app/features/movies/presentation/screens/infinite_gridview_widget.dart';
import 'package:smoth_movie_app/features/movies/presentation/screens/list_recently_update_movie_widget.dart';
import 'package:smoth_movie_app/init_dependencies.dart';

class PhimTruyenHinhTab extends StatelessWidget {
  const PhimTruyenHinhTab({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final String path = 'tv-shows';
    final sHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        spacing: sHeight / (sHeight / 20),
        children: [
          BlocProvider<RecentlyUpdateMoviesBloc>(
            create: (context) => serviceLocator(),
            child: const CarouselSliderWidget(),
          ),
          BlocProvider<MoviesBloc>(
            create: (context) => serviceLocator()
              ..add(GetListMovies(
                path: path,
                limit: 30,
              )),
            child: InfiniteGridView(path: path),
          ),
        ],
      ),
    );
  }
}
