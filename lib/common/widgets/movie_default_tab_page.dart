import 'package:flutter/material.dart';

class MovieDefaultTabPage extends StatelessWidget {
  const MovieDefaultTabPage({
    super.key,
    required this.sHeight,
    required this.sWidth,
    required this.player,
    required this.leadingIcon,
    required this.nestedScrollContent,
  });

  final double sHeight;
  final double sWidth;
  final Widget player;
  final Widget leadingIcon;
  final Widget nestedScrollContent;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: player,
          ),
          Positioned(
            top: sHeight / (sHeight / 12),
            left: sWidth / (sWidth / 10),
            child: leadingIcon,
          ),
          Positioned(
            top: 260,
            left: 0,
            right: 0,
            bottom: 0,
            child: nestedScrollContent,
          ),
        ],
      ),
    );
  }
}