import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../controller/controller.dart';
import 'widgets/play_pause_button.dart';
import 'widgets/progress_bar.dart';
import 'widgets/seek_buttons.dart';
import 'widgets/brightness_indicator.dart';
import 'widgets/volume_indicator.dart';
import 'utils/enums.dart';

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
          // Tầng 1: Render Video Texture (Sử dụng RepaintBoundary để tách biệt lớp vẽ video)
          RepaintBoundary(child: VideoPlayer(coreController)),

          // Tầng 2: Brightness/Volume Indicator
          Positioned(
            top: 20,
            child: IgnorePointer(
              child: BrightnessIndicator(controller: widget.controller),
            ),
          ),
          Positioned(
            top: 20,
            child: IgnorePointer(
              child: VolumeIndicator(controller: widget.controller),
            ),
          ),

          // Tầng 3: Overlay Controls (Giao diện điều khiển)
          _buildOverlayControls(),

          // Tầng 4: Gesture Layer (Chỉ hiển thị khi ở chế độ Fullscreen)
          ValueListenableBuilder<bool>(
            valueListenable: widget.controller.isFullscreen,
            builder: (context, isFullscreen, _) {
              if (!isFullscreen) return const SizedBox.shrink();
              return Positioned.fill(
                child: GestureDetector(onVerticalDragUpdate: _onVerticalDrag),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildOverlayControls() {
    return Stack(
      children: [
        /// Lớp 1: GestureDetector "Vĩnh cửu" - Zero re-build, chỉ bắt Tap
        /// để ẩn/hiện
        Positioned.fill(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: widget.controller.toggleControlsVisibility,
          ),
        ),

        /// Lớp 2: UI Controls với RepaintBoundary để tối ưu vẽ
        Positioned.fill(
          child: RepaintBoundary(
            child: ValueListenableBuilder<bool>(
              valueListenable: widget.controller.isControlsVisible,
              builder: (context, isVisible, child) {
                return AnimatedOpacity(
                  opacity: isVisible ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: IgnorePointer(ignoring: !isVisible, child: child),
                );
              },

              /// Lớp 3: Nội dung controls được cache trong 'child' của Builder
              child: _SimpleFlixControlPanel(controller: widget.controller),
            ),
          ),
        ),
      ],
    );
  }

  void _onVerticalDrag(DragUpdateDetails details) {
    final side = _getScreenSide(details);

    switch (side) {
      case ScreenSide.left:
        _onUpdateVolume(details);
      case ScreenSide.right:
        _onUpdateBrightness(details);
    }
  }

  void _onUpdateBrightness(DragUpdateDetails details) {
    // Vuốt lên chi tiết âm, vuốt xuống dương -> đảo ngược để vuốt lên tăng
    final delta = -details.primaryDelta! / 200;

    // Cập nhật độ sáng thông qua Controller
    widget.controller.updateBrightness(delta);
  }

  void _onUpdateVolume(DragUpdateDetails details) {
    // Vuốt lên chi tiết âm, vuốt xuống dương -> đảo ngược để vuốt lên tăng
    final delta = -details.primaryDelta! / 200;

    // Cập nhật âm lượng thông qua Controller
    widget.controller.updateVolume(delta);
  }

  ScreenSide _getScreenSide(DragUpdateDetails details) {
    final width = MediaQuery.sizeOf(context).width;
    return details.localPosition.dx > width / 2
        ? ScreenSide.right
        : ScreenSide.left;
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

/// [_SimpleFlixControlPanel] chứa các thành phần UI của Overlay.
/// Tách ra thành StatelessWidget để tối ưu hóa việc so sánh Widget Tree và Re-paint.
class _SimpleFlixControlPanel extends StatelessWidget {
  const _SimpleFlixControlPanel({required this.controller});

  final SimpleFlixController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: controller.toggleControlsVisibility,
      behavior: HitTestBehavior.opaque,
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
                  SeekBackwardButton(controller: controller),
                  PlayPauseButton(controller: controller),
                  SeekForwardButton(controller: controller),
                ],
              ),
            ),

            // Progress Bar (Sử dụng luồng tín hiệu riêng biệt bên trong)
            Positioned(
              left: 0,
              right: 0,
              bottom: 10,
              child: ProgressBar(controller: controller),
            ),
          ],
        ),
      ),
    );
  }
}
