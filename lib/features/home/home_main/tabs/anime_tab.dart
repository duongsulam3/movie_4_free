import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/features/movies/presentation/bloc/movies/movies_bloc.dart';
import 'package:smoth_movie_app/features/movies/presentation/screens/infinite_gridview_widget.dart';
import 'package:smoth_movie_app/init_dependencies.dart';

class AnimeTab extends StatelessWidget {
  const AnimeTab({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<MoviesBloc>()
        ..add(const GetListMovies(path: 'hoat-hinh', limit: 18)),
      child: InfiniteGridView(
        path: 'hoat-hinh',
        scrollController: scrollController,
      ),
    );
  }
}
