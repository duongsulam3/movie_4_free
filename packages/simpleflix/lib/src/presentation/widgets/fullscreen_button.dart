import 'package:flutter/material.dart';

import '../../controller/controller.dart';

class FullScreenButton extends StatelessWidget {
  const FullScreenButton({
    super.key,
    required this.controller,
  });

  final SimpleFlixController controller;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        final isFullscreen = controller.isFullscreen;

        return IconButton(
          icon: Icon(
            isFullscreen
                ? Icons.close_fullscreen_rounded
                : Icons.fullscreen_rounded,
            color: Colors.white,
            size: 24.0,
          ),
          onPressed: () {
            if (isFullscreen) {
              controller.exitFullscreen(context);
            } else {
              controller.enterFullscreen(context);
            }
          },
        );
      },
    );
  }
}
