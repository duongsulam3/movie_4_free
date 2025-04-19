import 'package:flutter/material.dart';

class MovieDetailPageWidget extends StatelessWidget {
  const MovieDetailPageWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: child,
      ),
    );
  }
}
