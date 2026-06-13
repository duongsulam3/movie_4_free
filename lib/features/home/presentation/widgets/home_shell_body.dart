import 'package:flutter/material.dart';

import '../../../../common/entity/page_item.dart';

class HomeShellBody extends StatelessWidget {
  const HomeShellBody({
    super.key,
    required this.currentBottomIndex,
    required this.pages,
  });

  final int currentBottomIndex;
  final List<PageItem> pages;

  @override
  Widget build(BuildContext context) {
    // Keep pages alive to preserve scroll positions and nested bloc states.
    return IndexedStack(
      index: currentBottomIndex,
      sizing: StackFit.expand,
      children: List.generate(pages.length, (i) => pages[i].widget),
    );
  }
}
