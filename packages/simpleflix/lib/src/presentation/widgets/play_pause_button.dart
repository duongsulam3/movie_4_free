import 'package:flutter/material.dart';

import '../../controller/controller.dart';

class PlayPauseButton extends StatelessWidget {
  const PlayPauseButton({super.key, required this.controller});

  final SimpleFlixController controller;

  @override
  Widget build(BuildContext context) {
    // Chỉ lắng nghe sự thay đổi của chính videoPlayerController cho nút này
    return ListenableBuilder(
      listenable: controller.controller,
      builder: (context, _) {
        final isPlaying = controller.controller.value.isPlaying;

        return IconButton(
          iconSize: 56.0,
          icon: Icon(
            isPlaying
                ? Icons.pause_circle_outline_rounded
                : Icons.play_circle_outline_rounded,
            color: Colors.white,
          ),
          onPressed: controller.togglePlay,
        );
      },
    );
  }
}
