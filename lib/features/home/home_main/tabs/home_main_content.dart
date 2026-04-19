import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/entity/home_main_content_grid_item.dart';
import 'package:smoth_movie_app/core/init_dependencies.dart';

import '../../../movies/presentation/bloc/recently_update_movies/recently_update_movies_bloc.dart';
import '../../../movies/presentation/screens/bloc_builder_recently_update_movies.dart';
import '../../enum/category.dart';
import '../widgets/title_and_gridview_list.dart';

class HomeMainContent extends StatefulWidget {
  const HomeMainContent({
    super.key,
    required this.scrollController,
    required this.tabController,
  });

  final ScrollController scrollController;
  final TabController tabController;

  @override
  State<HomeMainContent> createState() => _HomeMainContentState();
}

class _HomeMainContentState extends State<HomeMainContent> {
  late List<HomeMainContentGridItem> sections;
  final List<HomeCategoryTab> homeSections = const [
    HomeCategoryTab.anime,
    HomeCategoryTab.phimLe,
    HomeCategoryTab.phimBo,
    HomeCategoryTab.tvShows,
  ];

  List<HomeMainContentGridItem> buildSection(List<HomeCategoryTab> sections) {
    return List.generate(sections.length, (section) {
      return HomeMainContentGridItem(
        title: sections[section].homeGridTitle ?? "",
        path: sections[section].slug,
        tabIndex: section,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    sections = buildSection(homeSections);
  }

  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      controller: widget.scrollController,
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
            itemCount: sections.length,
            itemBuilder: (context, index) {
              final listItems = sections;
              return TitleAndGridViewList(
                sHeight: sHeight,
                tabController: widget.tabController,
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
