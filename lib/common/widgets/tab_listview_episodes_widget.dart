import 'package:flutter/material.dart';

class TabListViewEpisodes extends StatelessWidget {
  const TabListViewEpisodes({
    super.key,
    required this.sHeight,
    required this.itemCount,
    required this.itemBuilder,
  });

  final double sHeight;
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      primary: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}
