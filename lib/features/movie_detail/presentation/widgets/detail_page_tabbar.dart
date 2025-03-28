import 'package:flutter/material.dart';

class DetailPageTabBar extends StatelessWidget {
  const DetailPageTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      dividerHeight: 0,
      indicator: BoxDecoration(
        color: Colors.transparent,
      ),
      unselectedLabelColor: Colors.grey,
      unselectedLabelStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      labelColor: Colors.white,
      labelStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      tabs: [
        Tab(text: "Tập tiếp theo"),
        Tab(text: "Phim tương tự"),
      ],
    );
  }
}