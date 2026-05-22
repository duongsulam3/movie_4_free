import 'package:flutter/material.dart';

import '../../controller/controller.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key, required this.controller});

  final SimpleFlixController controller;

  @override
  Widget build(BuildContext context) {
    final coreController = controller.controller;

    // Thiết kế nguyên lý Atomic Re-build: Chỉ lắng nghe sự thay đổi của tiến trình video
    return ListenableBuilder(
      listenable: controller.videoPosition,
      builder: (context, _) {
        final position = controller.videoPosition.value;
        final duration = coreController.value.duration;

        final posMs = position.inMilliseconds;
        final durMs = duration.inMilliseconds;

        // Tránh lỗi chia cho 0 hoặc giá trị âm khi video chưa load xong Metadata
        final double progress = (durMs > 0 && posMs >= 0) ? posMs / durMs : 0.0;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            children: [
              Expanded(
                child: Slider(
                  value: progress.clamp(0.0, 1.0),
                  activeColor: Colors.red,
                  inactiveColor: Colors.white24,
                  onChanged: (value) {
                    final targetMs = (value * durMs).toInt();
                    // Gọi hàm seek thông qua Adapter Controller, không gọi trực tiếp xuống Driver
                    coreController.seekTo(Duration(milliseconds: targetMs));
                  },
                ),
              ),
              Text(
                "${_formatDuration(position)}/${_formatDuration(duration)}",
                style: const TextStyle(color: Colors.white, fontSize: 11.0),
              ),
            ],
          ),
        );
      },
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return '${twoDigits(minutes)}:${twoDigits(seconds)}';
  }
}
