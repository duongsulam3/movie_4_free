import 'package:flutter/material.dart';
import '../../controller/controller.dart';
import '../../ui/components/adaptive_icon_button.dart';

class SeekBackwardButton extends StatelessWidget {
  const SeekBackwardButton({super.key, required this.controller});

  final SimpleFlixController controller;

  @override
  Widget build(BuildContext context) {
    return AdaptiveIconButton(
      androidIcon: Icons.replay_5_rounded,
      iosIcon: Icons.replay_5_rounded,
      onPressed: controller.seekBackward,
    );
  }
}

class SeekForwardButton extends StatelessWidget {
  const SeekForwardButton({super.key, required this.controller});

  final SimpleFlixController controller;

  @override
  Widget build(BuildContext context) {
    return AdaptiveIconButton(
      androidIcon: Icons.forward_5_rounded,
      iosIcon: Icons.forward_5_rounded,
      onPressed: controller.seekForward,
    );
  }
}
