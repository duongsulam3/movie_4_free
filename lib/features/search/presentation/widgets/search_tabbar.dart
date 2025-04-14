import 'package:flutter/material.dart';

class SearchTabBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchTabBar({
    super.key,
    required this.searchTabsLength,
    required this.searchTabsBar,
    this.height = 30,
  });

  final int searchTabsLength;
  final List<String> searchTabsBar;
  final double height;

  @override
  Size get preferredSize => Size.fromHeight(height);

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
