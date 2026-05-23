import Flutter
import UIKit

@objc public class CustomVideoPlayerPlugin: NSObject, FlutterPlugin, NativeWakelockApi, NativeBrightnessApi {
  
  public static func register(with registrar: FlutterPluginRegistrar) {
    let instance = CustomVideoPlayerPlugin()
    NativeWakelockApiSetup.setUp(binaryMessenger: registrar.messenger(), api: instance)
    NativeBrightnessApiSetup.setUp(binaryMessenger: registrar.messenger(), api: instance)
    registrar.addMethodCallDelegate(instance, channel: FlutterMethodChannel(name: "unused", binaryMessenger: registrar.messenger()))
  }

  public func toggleWakelock(enable: Bool) throws {
    DispatchQueue.main.async {
        UIApplication.shared.isIdleTimerDisabled = enable
    }
  }

  public func setBrightness(brightness: Double) throws {
    DispatchQueue.main.async {
        UIScreen.main.brightness = CGFloat(brightness)
    }
  }

  public func getBrightness() throws -> Double {
    return Double(UIScreen.main.brightness)
  }
}