import 'package:flutter/material.dart';

class SearchPlayIcon extends StatelessWidget {
  const SearchPlayIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.play_circle_outline_rounded,
      size: 26,
      color: Colors.green,
    );
  }
}
