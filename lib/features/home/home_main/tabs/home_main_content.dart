import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/entity/home_main_content_grid_item.dart';
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

  final List<HomeMainContentGridItem> listItems = const [
    HomeMainContentGridItem(title: "Anime", path: "hoat-hinh", tabIndex: 1),
    HomeMainContentGridItem(title: "Phim lẻ", path: "phim-le", tabIndex: 2),
    HomeMainContentGridItem(title: "Phim bộ", path: "phim-bo", tabIndex: 3),
    HomeMainContentGridItem(
      title: "Chương trình truyền hình",
      path: "tv-shows",
      tabIndex: 4,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      controller: scrollController,
      scrollDirection: Axis.vertical,
      child: Column(
        spacing: sHeight / (sHeight / 10),
        children: [
          BlocProvider<RecentlyUpdateMoviesBloc>(
            create: (context) => serviceLocator(),
            child: const BlocBuilderRecentlyUpdateMovies(),
          ),
          ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            primary: false,
            itemCount: listItems.length,
            itemBuilder: (context, index) {
              return TitleAndGridViewList(
                sHeight: sHeight,
                tabController: tabController,
                title: listItems[index].title,
                path: listItems[index].path,
                tabIndex: listItems[index].tabIndex,
              );
            },
          )
        ],
      ),
    );
  }
}
