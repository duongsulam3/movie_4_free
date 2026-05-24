import Flutter
import UIKit
import AVFoundation
import MediaPlayer

@objc public class CustomVideoPlayerPlugin: NSObject, FlutterPlugin, NativeWakelockApi, NativeBrightnessApi, NativeVolumeApi {
  
  public static func register(with registrar: FlutterPluginRegistrar) {
    let instance = CustomVideoPlayerPlugin()
    NativeWakelockApiSetup.setUp(binaryMessenger: registrar.messenger(), api: instance)
    NativeBrightnessApiSetup.setUp(binaryMessenger: registrar.messenger(), api: instance)
    NativeVolumeApiSetup.setUp(binaryMessenger: registrar.messenger(), api: instance)
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

  public func setVolume(volume: Double) throws {
    DispatchQueue.main.async {
      let volumeView = MPVolumeView()
      if let slider = volumeView.subviews.first(where: { $0 is UISlider }) as? UISlider {
        slider.value = Float(volume)
      }
    }
  }

  public func getVolume() throws -> Double {
    return Double(AVAudioSession.sharedInstance().outputVolume)
  }
}