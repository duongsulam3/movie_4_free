import 'package:flutter/material.dart';

class MoviesSilverGridviewBuilder extends StatelessWidget {
  const MoviesSilverGridviewBuilder({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
  });

  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
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
