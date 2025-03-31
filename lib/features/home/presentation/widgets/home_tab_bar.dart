import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/entity/tab_item.dart';

class HomeTabBar extends StatelessWidget {
  const HomeTabBar(
      {super.key, required this.tabs, required this.tabController});

  final List<TabItem> tabs;
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      isScrollable: true,
      tabAlignment: TabAlignment.start,
      indicator: const BoxDecoration(color: Colors.transparent),
      dividerHeight: 0,
      unselectedLabelColor: Colors.grey,
      unselectedLabelStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      labelColor: Colors.white,
      labelStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      tabs: List.generate(
        tabs.length,
        (i) => Tab(text: tabs[i].title),
      ),
    );
  }
}
