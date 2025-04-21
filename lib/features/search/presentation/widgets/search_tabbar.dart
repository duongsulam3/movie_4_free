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
      tabs: List.generate(
        searchTabsLength,
        (index) => Tab(
          text: searchTabsBar[index],
        ),
      ),
    );
  }
}
