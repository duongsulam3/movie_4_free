import 'package:flutter/services.dart';

class NativeWakelock {
  // Định nghĩa tên Channel duy nhất để tránh xung đột với các package khác của Client
  static const MethodChannel _channel = MethodChannel(
    'com.simpleflix.videoplayer/wakelock',
  );

  /// Kích hoạt giữ màn hình luôn sáng
  static Future<void> enable() async {
    try {
      await _channel.invokeMethod('toggleWakelock', {'enable': true});
    } on PlatformException catch (e) {
      assert(false, "Failed to enable Native Wakelock: ${e.message}");
    }
  }

  /// Hủy kích hoạt, trả màn hình về trạng thái quản lý mặc định của OS
  static Future<void> disable() async {
    try {
      await _channel.invokeMethod('toggleWakelock', {'enable': false});
    } on PlatformException catch (e) {
      assert(false, "Failed to disable Native Wakelock: ${e.message}");
    }
  }
}
