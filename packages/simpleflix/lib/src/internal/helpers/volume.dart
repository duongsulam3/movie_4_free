import '../messages.g.dart';

class NativeVolume {
  static final _api = NativeVolumeApi();

  /// Thiết lập âm lượng hệ thống (0.0 đến 1.0)
  static Future<void> setVolume(double volume) async {
    try {
      await _api.setVolume(volume);
    } catch (e) {
      assert(false, "Failed to set Native Volume: $e");
    }
  }

  /// Lấy âm lượng hệ thống hiện tại (0.0 đến 1.0)
  static Future<double> getVolume() async {
    try {
      return await _api.getVolume();
    } catch (e) {
      assert(false, "Failed to get Native Volume: $e");
      return 0.5;
    }
  }
}
