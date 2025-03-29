import 'package:flutter/material.dart';

class HomeMain extends StatelessWidget {
  const HomeMain({super.key, required this.tabs, required this.tabController});
  final List<Map<String, dynamic>> tabs;
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      children: List.generate(
        tabs.length,
        (i) => tabs[i]['widget'],
      ),
    );
  }
}
