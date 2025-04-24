import 'package:flutter/material.dart';

class MoviesGridBuilder extends StatelessWidget {
  const MoviesGridBuilder({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.primary = false,
  });

  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  final bool primary;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      addAutomaticKeepAlives: true,
      shrinkWrap: true,
      primary: primary,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        mainAxisExtent: 220,
      ),
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}
