import 'package:flutter/material.dart';

class ProgressIndicatorCustom extends StatelessWidget {
  const ProgressIndicatorCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator.adaptive(
      strokeWidth: 2,
      constraints: BoxConstraints(
        maxWidth: 34,
        maxHeight: 34,
        minWidth: 26,
        minHeight: 26,
      ),
    );
  }
}
