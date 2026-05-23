import '../messages.g.dart';

class NativeWakelock {
  static final _api = NativeWakelockApi();

  /// Kích hoạt giữ màn hình luôn sáng
  static Future<void> enable() async {
    try {
      await _api.toggleWakelock(true);
    } catch (e) {
      assert(false, "Failed to enable Native Wakelock: $e");
    }
  }

  /// Hủy kích hoạt, trả màn hình về trạng thái quản lý mặc định của OS
  static Future<void> disable() async {
    try {
      await _api.toggleWakelock(false);
    } catch (e) {
      assert(false, "Failed to disable Native Wakelock: $e");
    }
  }
}
