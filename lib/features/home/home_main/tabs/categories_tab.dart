import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/features/movies/presentation/bloc/movies/movies_bloc.dart';
import 'package:smoth_movie_app/features/movies/presentation/bloc/movies_sortby_time/movies_sort_by_time_bloc.dart';
import 'package:smoth_movie_app/features/movies/presentation/screens/bloc_builder_movies_sort_by_time.dart';
import 'package:smoth_movie_app/features/movies/presentation/screens/infinite_gridview_widget.dart';
import 'package:smoth_movie_app/init_dependencies.dart';

class CategoriesTab extends StatefulWidget {
  const CategoriesTab({
    super.key,
    required this.scrollController,
    required this.path,
    this.limit = 30,
  });

  final ScrollController scrollController;
  final String path;
  final int limit;

  @override
  State<CategoriesTab> createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
  late List<BlocProvider> providers;

  @override
  void initState() {
    super.initState();
    initProviders();
  }

  void initProviders() {
    providers = [
      BlocProvider<MoviesSortByTimeBloc>(
        create: (context) => serviceLocator()
          ..add(GetSortByTimeMovies(
            cateName: widget.path,
            page: 1,
            sortfield: "modified.time",
          )),
      ),
      BlocProvider<MoviesBloc>(
        create: (context) => serviceLocator()
          ..add(GetListMovies(
            path: widget.path,
            limit: widget.limit,
          )),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.of(context).size.height;
    return MultiBlocProvider(
      providers: providers,
      child: SingleChildScrollView(
        controller: widget.scrollController,
        child: Column(
          spacing: sHeight / (sHeight / 20),
          children: [
            const BlocBuilderMoviesSortByTime(),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child:
                  InfiniteGridView(path: widget.path, itemCount: widget.limit),
            ),
          ],
        ),
      ),
    );
  }
}
