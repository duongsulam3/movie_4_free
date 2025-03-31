import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/entity/tab_item.dart';

class HomeMain extends StatelessWidget {
  const HomeMain({super.key, required this.tabs, required this.tabController});
  final List<TabItem> tabs;
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      children: List.generate(
        tabs.length,
        (i) => tabs[i].widget,
      ),
    );
  }
}
