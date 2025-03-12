import 'package:flutter/material.dart';

class HomeMain extends StatelessWidget {
  final List<Map<String, dynamic>> tabs;
  const HomeMain({super.key, required this.tabs});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: List.generate(
        tabs.length,
        (i) => tabs[i]['widget'],
      ),
    );
  }
}
