import 'package:flutter/material.dart';

class MoviesGridBuilder extends StatelessWidget {
  const MoviesGridBuilder({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.primary = true,
  });

  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  final bool primary;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      itemBuilder: itemBuilder,
      primary: primary,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        mainAxisExtent: 220,
      ),
    );
  }
}
