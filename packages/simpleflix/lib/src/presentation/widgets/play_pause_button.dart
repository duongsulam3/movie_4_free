import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../controller/controller.dart';
import '../../ui/components/adaptive_icon_button.dart';

class PlayPauseButton extends StatelessWidget {
  const PlayPauseButton({super.key, required this.controller});

  final SimpleFlixController controller;

  IconData _getIconAndroid(bool isPlaying) => isPlaying
      ? Icons.pause_circle_outline_rounded
      : Icons.play_circle_outline_rounded;

  IconData _getIconIos(bool isPlaying) =>
      isPlaying ? CupertinoIcons.pause_fill : CupertinoIcons.play_arrow_solid;

  @override
  Widget build(BuildContext context) {
    // Chỉ lắng nghe sự thay đổi của chính videoPlayerController cho nút này
    return ListenableBuilder(
      listenable: controller.controller,
      builder: (context, _) {
        final isPlaying = controller.controller.value.isPlaying;
        return AdaptiveIconButton(
          androidIcon: _getIconAndroid(isPlaying),
          iosIcon: _getIconIos(isPlaying),
          color: Colors.white,
          size: 56.0,
          onPressed: controller.togglePlay,
        );
      },
    );
  }
}
