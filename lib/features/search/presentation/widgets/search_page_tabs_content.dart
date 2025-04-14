import 'package:flutter/material.dart';

class SearchPageTabsContent extends StatelessWidget {
  const SearchPageTabsContent({
    super.key,
    required this.searchTabsLength,
    required this.searchTabsView,
  });

  final int searchTabsLength;
  final List<Widget> searchTabsView;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TabBarView(
        children: List.generate(
          searchTabsLength,
          (index) => searchTabsView[index],
        ),
      ),
    );
  }
}