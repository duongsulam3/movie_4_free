import '../messages.g.dart';

class NativeBrightness {
  static final _api = NativeBrightnessApi();

  /// Thiết lập độ sáng màn hình (0.0 đến 1.0)
  static Future<void> setBrightness(double brightness) async {
    try {
      await _api.setBrightness(brightness);
    } catch (e) {
      assert(false, "Failed to set Native Brightness: $e");
    }
  }

  /// Lấy độ sáng màn hình hiện tại (0.0 đến 1.0)
  static Future<double> getBrightness() async {
    try {
      return await _api.getBrightness();
    } catch (e) {
      assert(false, "Failed to get Native Brightness: $e");
      return 0.5;
    }
  }
}
