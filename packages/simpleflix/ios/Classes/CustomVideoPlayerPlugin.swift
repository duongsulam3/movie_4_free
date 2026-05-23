import Flutter
import UIKit

public class CustomVideoPlayerPlugin: NSObject, FlutterPlugin, NativeWakelockApi {
  
  public static func register(with registrar: FlutterPluginRegistrar) {
    let instance = CustomVideoPlayerPlugin()
    NativeWakelockApiSetup.setUp(binaryMessenger: registrar.messenger(), api: instance)
    registrar.addMethodCallDelegate(instance, channel: FlutterMethodChannel(name: "unused", binaryMessenger: registrar.messenger()))
  }

  public func toggleWakelock(enable: Bool) throws {
    DispatchQueue.main.async {
        UIApplication.shared.isIdleTimerDisabled = enable
    }
  }
}