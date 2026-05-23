import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../controller/controller.dart';
import 'widgets/play_pause_button.dart';
import 'widgets/progress_bar.dart';
import 'widgets/seek_buttons.dart';
import 'widgets/brightness_indicator.dart';

/// [SimpleFlix] là Entry Point của tầng UI.
/// Widget này nhận vào Controller đã được khởi tạo từ phía Client.
class SimpleFlix extends StatefulWidget {
  const SimpleFlix({
    super.key,
    required this.controller,
    this.alwaysOnDisplay = true,
  });

  final SimpleFlixController controller;
  final bool alwaysOnDisplay;

  @override
  State<SimpleFlix> createState() => _SimpleFlixState();
}

class _SimpleFlixState extends State<SimpleFlix> {
  @override
  void initState() {
    super.initState();
    // Đồng bộ cấu hình từ UI xuống Controller ngay khi khởi tạo State
    widget.controller.updateAlwaysOnDisplay(widget.alwaysOnDisplay);
  }

  @override
  void didUpdateWidget(covariant SimpleFlix oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Best Practice: Nếu Widget cha Re-build và thay đổi giá trị cấu hình,
    // chúng ta phải cập nhật ngay xuống Controller để thay đổi hành vi Native
    if (widget.alwaysOnDisplay != oldWidget.alwaysOnDisplay) {
      widget.controller.updateAlwaysOnDisplay(widget.alwaysOnDisplay);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      // Sử dụng Future đã được cache từ Controller
      future: widget.controller.initializeFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return _buildErrorWidget(snapshot.error.toString());
          }
          return _buildPlayerCore();
        } else {
          return _buildLoadingWidget();
        }
      },
    );
  }

  Widget _buildPlayerCore() {
    final coreController = widget.controller.controller;

    return AspectRatio(
      aspectRatio: coreController.value.aspectRatio,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          // Tầng 1: Render Video Texture từ Native Layer
          VideoPlayer(coreController),

          // Tầng 2: Gesture Layer (Điều chỉnh độ sáng)
          if (widget.controller.isFullscreen)
            Positioned.fill(
              child: GestureDetector(
                onVerticalDragUpdate: (details) {
                  final width = MediaQuery.sizeOf(context).width;
                  final isRightSide = details.localPosition.dx > width / 2;

                  if (isRightSide) {
                    // Vuốt lên chi tiết âm, vuốt xuống dương -> đảo ngược để vuốt lên tăng
                    final delta = -details.primaryDelta! / 200;
                    widget.controller.updateBrightness(delta);
                  }
                },
              ),
            ),

          // Tầng 3: Brightness Indicator (Hiển thị khi đang chỉnh)
          Positioned.fill(
            child: IgnorePointer(
              child: BrightnessIndicator(controller: widget.controller),
            ),
          ),

          // Tầng 4: Overlay Controls (Giao diện điều khiển)
          _buildOverlayControls(),
        ],
      ),
    );
  }

  Widget _buildOverlayControls() {
    return ValueListenableBuilder<bool>(
      valueListenable: widget.controller.isControlsVisible,
      builder: (context, isVisible, child) {
        return Positioned.fill(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: widget.controller.toggleControlsVisibility,
            child: AnimatedOpacity(
              opacity: isVisible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: IgnorePointer(ignoring: !isVisible, child: child),
            ),
          ),
        );
      },

      // Sử dụng thuộc tính child của ValueListenableBuilder để tránh re-build các nút tĩnh
      child: Container(
        // Làm tối background để nổi bật nút điều khiển
        color: Colors.black.withValues(alpha: 0.3),
        child: Stack(
          children: [
            // Đặt các nút điều khiển chính ở trung tâm
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SeekBackwardButton(controller: widget.controller),
                  PlayPauseButton(controller: widget.controller),
                  SeekForwardButton(controller: widget.controller),
                ],
              ),
            ),

            // Tầng 3: Progress Bar (Luồng dữ liệu riêng biệt, tối ưu re-render)
            Positioned(
              left: 0,
              right: 0,
              bottom: 10,
              child: ProgressBar(controller: widget.controller),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
        strokeWidth: 0.8,
      ),
    );
  }

  Widget _buildErrorWidget(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, color: Colors.red, size: 42),
          const SizedBox(height: 8),
          Text(
            'Video Error: $error',
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
