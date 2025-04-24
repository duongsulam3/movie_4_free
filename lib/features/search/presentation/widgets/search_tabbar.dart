import 'package:flutter/material.dart';

class SearchTabBar extends StatelessWidget {
  const SearchTabBar({
    super.key,
    required this.searchTabsLength,
    required this.searchTabsBar,
  });

  final int searchTabsLength;
  final List<String> searchTabsBar;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabAlignment: TabAlignment.fill,
      indicator: const BoxDecoration(color: Colors.transparent),
      dividerHeight: 0,
      unselectedLabelColor: Colors.grey,
      unselectedLabelStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      labelColor: Colors.white,
      labelStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      tabs: List.generate(
        searchTabsLength,
        (index) => Tab(
          text: searchTabsBar[index],
        ),
      ),
    );
  }
}
