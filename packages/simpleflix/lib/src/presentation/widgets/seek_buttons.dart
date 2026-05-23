import 'package:flutter/material.dart';
import '../../controller/controller.dart';

class SeekBackwardButton extends StatelessWidget {
  const SeekBackwardButton({super.key, required this.controller});

  final SimpleFlixController controller;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 24.0,
      icon: const Icon(Icons.replay_5_rounded, color: Colors.white),
      onPressed: controller.seekBackward,
    );
  }
}

class SeekForwardButton extends StatelessWidget {
  const SeekForwardButton({super.key, required this.controller});

  final SimpleFlixController controller;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 24.0,
      icon: const Icon(Icons.forward_5_rounded, color: Colors.white),
      onPressed: controller.seekForward,
    );
  }
}
