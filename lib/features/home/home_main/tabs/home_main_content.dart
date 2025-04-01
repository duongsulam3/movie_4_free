import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/features/home/home_main/widgets/title_and_gridview_list.dart';
import 'package:smoth_movie_app/features/movies/presentation/bloc/recently_update_movies/recently_update_movies_bloc.dart';
import 'package:smoth_movie_app/features/movies/presentation/screens/bloc_builder_recently_update_movies.dart';
import 'package:smoth_movie_app/init_dependencies.dart';

class HomeMainContent extends StatelessWidget {
  const HomeMainContent({
    super.key,
    required this.scrollController,
    required this.tabController,
  });

  final ScrollController scrollController;
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      controller: scrollController,
      scrollDirection: Axis.vertical,
      child: Column(
        spacing: sHeight / (sHeight / 20),
        children: [
          BlocProvider<RecentlyUpdateMoviesBloc>(
            create: (context) {
              return serviceLocator()..add(GetRecentlyUpdateMovies());
            },
            child: const BlocBuilderRecentlyUpdateMovies(),
          ),
          TitleAndGridViewList(
            sHeight: sHeight,
            title: "Anime",
            path: "hoat-hinh",
            tabController: tabController,
            tabIndex: 1,
          ),
          TitleAndGridViewList(
            sHeight: sHeight,
            title: "Phim lẻ",
            path: "phim-le",
            tabController: tabController,
            tabIndex: 2,
          ),
          TitleAndGridViewList(
            sHeight: sHeight,
            title: "Phim bộ",
            path: "phim-bo",
            tabController: tabController,
            tabIndex: 3,
          ),
          TitleAndGridViewList(
            sHeight: sHeight,
            title: "Chương trình truyền hình",
            path: "tv-shows",
            tabController: tabController,
            tabIndex: 4,
          ),
        ],
      ),
    );
  }
}
