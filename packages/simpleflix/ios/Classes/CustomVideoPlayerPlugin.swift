import Flutter
import UIKit

public class CustomVideoPlayerPlugin: NSObject, FlutterPlugin {
  
  // Trực tiếp đăng ký Plugin với hệ thống quản lý của Flutter iOS
  public static func register(with registrar: FlutterPluginRegistrar) {
    // 1. Khởi tạo một MethodChannel độc lập
    // Cần truyền binaryMessenger lấy từ registrar để làm kênh truyền dữ liệu nhị phân
    let channel = FlutterMethodChannel(
        name: "com.simpleflix.videoplayer/wakelock", 
        binaryMessenger: registrar.messenger()
    )
    
    // 2. Khởi tạo thực thể (Instance) của Plugin chịu trách nhiệm xử lý Logic
    let instance = CustomVideoPlayerPlugin()
    
    // 3. CHUẨN HÓA: Đăng ký Handler TRÊN ĐỐI TƯỢNG CHANNEL, chứ không phải registrar
    // Chúng ta ủy quyền (Delegate) việc xử lý tín hiệu cho 'instance' vừa tạo
    channel.setMethodCallHandler(instance.handle)
  }

  // Hàm xử lý các cuộc gọi từ tầng Dart (Flutter) xuống
  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "toggleWakelock":
        handleToggleWakelock(call: call, result: result)
    default:
        result(FlutterMethodNotImplemented)
    }
  }

  // Phân rã hàm (Decomposition) thành các khối xử lý chuyên biệt (Single Responsibility)
  private func handleToggleWakelock(call: FlutterMethodCall, result: @escaping FlutterResult) {
    guard let args = call.arguments as? [String: Any],
          let enable = args["enable"] as? Bool else {
        result(FlutterError(
            code: "BAD_ARGUMENTS", 
            message: "Arguments are invalid or missing 'enable' key", 
            details: nil
        ))
        return
    }
    
    // Can thiệp trực tiếp vào phần cứng iOS thông qua Main Thread
    DispatchQueue.main.async {
        UIApplication.shared.isIdleTimerDisabled = enable
        result(nil)
    }
  }
}