import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';

class HomeTabBar extends StatelessWidget {
  const HomeTabBar({super.key, required this.tabs});

  final List<Map<String, dynamic>> tabs;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      tabAlignment: TabAlignment.start,
      dividerColor: Colors.transparent,
      indicator: const BoxDecoration(
        color: Colors.transparent,
      ),
      tabs: List.generate(
        tabs.length,
        (i) => Tab(
          child: ResponsiveText(text: tabs[i]["title"]),
        ),
      ),
    );
  }
}
