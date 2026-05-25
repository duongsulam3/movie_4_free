import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';
import 'dart:async';

import '../internal/helpers/wakelock.dart';
import '../internal/helpers/brightness.dart';
import '../internal/helpers/volume.dart';
import '../presentation/player_presentation.dart';

/// [SimpleFlixController] đóng vai trò là một Adapter quản lý State
/// và điều khiển [VideoPlayerController] gốc.
class SimpleFlixController extends ChangeNotifier {
  SimpleFlixController({
    required this.controller,
    this.autoPlay = false,
    this.looping = false,
    this.alwaysOnDisplay = true,
  }) {
    _initialize();
  }

  final VideoPlayerController controller;
  final bool autoPlay;
  final bool looping;

  // Thuộc tính cấu hình quyền kiểm soát màn hình sáng/tối
  bool alwaysOnDisplay;

  // Cache lại Future khởi tạo để tránh việc tái khởi tạo khi đổi Route
  Future<void>? _initializeFuture;
  Future<void>? get initializeFuture => _initializeFuture;

  // Sử dụng ValueNotifier độc lập để tối ưu Re-render cho Progress Bar
  final ValueNotifier<Duration> videoPosition = ValueNotifier(Duration.zero);
  final ValueNotifier<bool> isControlsVisible = ValueNotifier(true);

  // Quản lý độ sáng màn hình
  final ValueNotifier<double> brightness = ValueNotifier(0.5);
  final ValueNotifier<bool> isBrightnessIndicatorVisible = ValueNotifier(false);
  Timer? _brightnessTimer;

  // Quản lý âm lượng hệ thống
  final ValueNotifier<double> volume = ValueNotifier(0.5);
  final ValueNotifier<bool> isVolumeIndicatorVisible = ValueNotifier(false);
  Timer? _volumeTimer;

  Timer? _hideTimer;

  void _initialize() {
    controller.addListener(_videoListener);
    // Khởi tạo độ sáng từ hệ thống
    NativeBrightness.getBrightness().then((value) {
      brightness.value = value;
    });

    // Khởi tạo âm lượng từ hệ thống
    NativeVolume.getVolume().then((value) {
      volume.value = value;
    });

    // Cấu hình looping
    if (looping) {
      controller.setLooping(true);
    }

    // Nếu autoPlay được bật, chúng ta sẽ tự động play sau khi khởi tạo xong
    if (autoPlay && !controller.value.isPlaying) {
      controller.play();
    }

    // Kích hoạt khởi tạo tại tầng Controller ngay khi Object được tạo ra
    _initializeFuture = controller.initialize().then((_) {
      if (autoPlay && !controller.value.isPlaying) {
        controller.play();
      }
      // Bắt đầu đếm ngược ẩn controls ngay sau khi khởi tạo xong nếu đang autoPlay
      if (autoPlay) {
        _startHideTimer();
      }

      // Thông báo cho UI biết rằng video đã sẵn sàng để hiển thị
      notifyListeners();
    });
  }

  void _startHideTimer() {
    _hideTimer?.cancel();
    _hideTimer = Timer(const Duration(seconds: 5), () {
      isControlsVisible.value = false;
    });
  }

  /// Reset lại timer khi có tương tác từ người dùng
  void resetHideTimer() {
    if (isControlsVisible.value) {
      _startHideTimer();
    }
  }

  void _videoListener() {
    // Cập nhật vị trí video hiện tại
    videoPosition.value = controller.value.position;
    _handleWakelock();
  }

  /// Quản lý trạng thái WakeLock kết hợp điều kiện cấu hình từ UI
  void _handleWakelock() {
    // Nếu Client chủ động tắt tính năng này, lập tức giải phóng Wake Lock để tiết kiệm pin
    if (!alwaysOnDisplay) {
      NativeWakelock.disable();
      return;
    }

    final isPlaying = controller.value.isPlaying;
    if (isPlaying) {
      NativeWakelock.enable();
    } else {
      NativeWakelock.disable();
    }
  }

  /// Cung cấp API công khai để UI cập nhật cấu hình theo thời gian thực (Runtime Dynamic Update)
  void updateAlwaysOnDisplay(bool value) {
    if (alwaysOnDisplay == value) return;
    alwaysOnDisplay = value;
    // Kích hoạt tính toán lại trạng thái phần cứng ngay lập tức
    _handleWakelock();
  }

  void togglePlay() {
    if (controller.value.isPlaying) {
      controller.pause();
      // Khi dừng video, có thể giữ controls hiện (tùy UX), ở đây ta reset timer
      _hideTimer?.cancel();
    } else {
      controller.play();
      _startHideTimer();
    }
  }

  void toggleControlsVisibility() {
    isControlsVisible.value = !isControlsVisible.value;
    if (isControlsVisible.value) {
      _startHideTimer();
    } else {
      _hideTimer?.cancel();
    }
  }

  /// Tua tới 5 giây
  void seekForward() {
    resetHideTimer();
    final currentPosition = controller.value.position;
    final duration = controller.value.duration;
    final targetPosition = currentPosition + const Duration(seconds: 5);

    if (targetPosition > duration) {
      controller.seekTo(duration);
    } else {
      controller.seekTo(targetPosition);
    }
  }

  /// Tua lùi 5 giây
  void seekBackward() {
    resetHideTimer();
    final currentPosition = controller.value.position;
    final targetPosition = currentPosition - const Duration(seconds: 5);

    if (targetPosition < Duration.zero) {
      controller.seekTo(Duration.zero);
    } else {
      controller.seekTo(targetPosition);
    }
  }

  /// Cập nhật độ sáng màn hình dựa trên delta vuốt
  void updateBrightness(double delta) {
    double newValue = brightness.value + delta;
    if (newValue < 0.0) newValue = 0.0;
    if (newValue > 1.0) newValue = 1.0;

    if (brightness.value != newValue) {
      brightness.value = newValue;
      NativeBrightness.setBrightness(newValue);

      // Hiển thị indicator
      isBrightnessIndicatorVisible.value = true;
      _brightnessTimer?.cancel();
      _brightnessTimer = Timer(const Duration(seconds: 2), () {
        isBrightnessIndicatorVisible.value = false;
      });
    }
  }

  /// Cập nhật âm lượng hệ thống dựa trên delta vuốt
  void updateVolume(double delta) {
    double newValue = volume.value + delta;
    if (newValue < 0.0) newValue = 0.0;
    if (newValue > 1.0) newValue = 1.0;

    if (volume.value != newValue) {
      volume.value = newValue;
      NativeVolume.setVolume(newValue);

      // Hiển thị indicator
      isVolumeIndicatorVisible.value = true;
      _volumeTimer?.cancel();
      _volumeTimer = Timer(const Duration(seconds: 2), () {
        isVolumeIndicatorVisible.value = false;
      });
    }
  }

  @override
  void dispose() {
    _hideTimer?.cancel();
    _brightnessTimer?.cancel();
    _volumeTimer?.cancel();
    controller.removeListener(_videoListener);
    videoPosition.dispose();
    isControlsVisible.dispose();
    brightness.dispose();
    isBrightnessIndicatorVisible.dispose();
    volume.dispose();
    isVolumeIndicatorVisible.dispose();
    NativeWakelock.disable();
    super.dispose();
  }

  // Quản lý trạng thái Fullscreen độc lập
  bool _isFullscreen = false;
  bool get isFullscreen => _isFullscreen;

  /// Hàm kích hoạt chế độ Toàn màn hình
  void enterFullscreen(BuildContext context) {
    if (_isFullscreen) return;
    _isFullscreen = true;
    notifyListeners();

    // 1. Ẩn thanh trạng thái và thanh điều hướng hệ thống
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersiveSticky,
      overlays: [], // Ẩn tất cả các overlay (status bar, navigation bar)
    );

    // 2. Ép buộc thiết bị xoay ngang
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    // 3. Đẩy một Route mới đè lên toàn màn hình
    Navigator.of(context).push(_buildFullscreenRoute()).then((_) {
      // Khi Route bị đóng (bởi Navigator.pop), tự động dọn dẹp trạng thái
      _exitFullscreenLogic();
    });
  }

  Route _buildFullscreenRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        // Trả về chính Widget CustomVideoPlayer nhưng nhận diện ngữ cảnh Fullscreen
        return Scaffold(
          backgroundColor: Colors.black,
          body: SizedBox.expand(
            child: SafeArea(child: SimpleFlix(controller: this)),
          ),
        );
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }

  /// Hàm thoát chế độ Toàn màn hình chủ động từ UI
  void exitFullscreen(BuildContext context) {
    if (!_isFullscreen) return;
    // Đóng Route Fullscreen, luồng xử lý sẽ rơi vào block .then() ở trên
    Navigator.of(context).pop();
  }

  void _exitFullscreenLogic() {
    _isFullscreen = false;
    notifyListeners();

    // 1. Hiển thị lại thanh hệ thống
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    // 2. Trả màn hình về trạng thái mặc định (Dọc)
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }
}
