import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../controller/controller.dart';
import '../../ui/components/adaptive_icon_button.dart';

class FullScreenButton extends StatelessWidget {
  const FullScreenButton({super.key, required this.controller});

  final SimpleFlixController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: controller.isFullscreen,
      builder: (context, isFullscreen, _) {
        return AdaptiveIconButton(
          androidIcon: _getIconShowUpAndroid(isFullscreen),
          iosIcon: _getIconShowUp(isFullscreen),
          color: Colors.white,
          size: 20.0,
          onPressed: () => _onPressed(context, isFullscreen),
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

  IconData _getIconShowUpAndroid(bool isFullscreen) {
    return isFullscreen
        ? Icons.fullscreen_exit_rounded
        : Icons.fullscreen_rounded;
  }

  IconData _getIconShowUp(bool isFullscreen) {
    return isFullscreen
        ? CupertinoIcons.fullscreen_exit
        : CupertinoIcons.fullscreen;
  }
}
