import 'package:flutter/material.dart';

import '../../controller/controller.dart';

class FullScreenButton extends StatelessWidget {
  const FullScreenButton({super.key, required this.controller});

  final SimpleFlixController controller;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        final isFullscreen = controller.isFullscreen;
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => _onPressed(context, isFullscreen),
          child: Icon(_getIconShowUp(), color: Colors.white, size: 24.0),
        );
      },
    );
  }

  void _onPressed(BuildContext context, bool isFullscreen) {
    controller.resetHideTimer();
    if (isFullscreen) {
      controller.exitFullscreen(context);
    } else {
      controller.enterFullscreen(context);
    }
  }

  IconData _getIconShowUp() {
    return controller.isFullscreen
        ? Icons.fullscreen_exit_rounded
        : Icons.fullscreen_rounded;
  }
}
