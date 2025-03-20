import 'package:flutter/material.dart';

class HomeTabBar extends StatelessWidget {
  const HomeTabBar({super.key, required this.tabs});

  final List<Map<String, dynamic>> tabs;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      tabAlignment: TabAlignment.start,
      indicator: const BoxDecoration(color: Colors.transparent),
      dividerHeight: 0,
      unselectedLabelColor: Colors.grey,
      unselectedLabelStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      labelColor: Colors.white,
      labelStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      tabs: List.generate(
        tabs.length,
        (i) => Tab(text: tabs[i]["title"]),
      ),
    );
  }
}
