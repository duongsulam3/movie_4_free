import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/entity/home_main_content_grid_item.dart';

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
    return List.generate(sections.length, (index) {
      final category = sections[index];
      return HomeMainContentGridItem(
        title: category.homeGridTitle ?? "",
        path: category.slug,
        // Use enum index to match the real TabBar order:
        // home(0), anime(1), phimLe(2), phimBo(3), tvShows(4).
        tabIndex: category.index,
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
          const BlocBuilderRecentlyUpdateMovies(),
          ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            primary: false,
            itemCount: sections.length,
            itemBuilder: (context, index) {
              return TitleAndGridViewList(
                sHeight: sHeight,
                tabController: widget.tabController,
                title: sections[index].title,
                path: sections[index].path,
                tabIndex: sections[index].tabIndex,
              );
            },
          )
        ],
      ),
    );
  }
}
