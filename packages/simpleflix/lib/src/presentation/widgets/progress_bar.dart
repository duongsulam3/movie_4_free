import 'package:flutter/material.dart';

import '../../controller/controller.dart';
import 'custom_slider.dart';
import 'fullscreen_button.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: Row(
            children: [
              Expanded(
                child: CustomSlider(
                  value: progress,
                  onChanged: (value) {
                    final targetMs = (value * durMs).toInt();
                    // Gọi hàm seek thông qua Adapter Controller, không gọi trực tiếp xuống Driver
                    coreController.seekTo(Duration(milliseconds: targetMs));
                  },
                ),
              ),

              // Hiển thị thời gian hiện tại và tổng thời lượng của video
              Text(
                "${_formatDuration(position)} / ${_formatDuration(duration)}",
                style: const TextStyle(color: Colors.white, fontSize: 10.0),
              ),

              // Tích hợp nút Fullscreen kế bên thời gian tổng của video
              FullScreenButton(controller: controller),
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
