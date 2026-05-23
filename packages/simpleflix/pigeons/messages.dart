import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/internal/messages.g.dart',
    dartOptions: DartOptions(),
    kotlinOut: 'android/src/main/kotlin/com/custom/simpleflix/Messages.g.kt',
    kotlinOptions: KotlinOptions(package: 'com.custom.simpleflix'),
    swiftOut: 'ios/Classes/Messages.g.swift',
    swiftOptions: SwiftOptions(),
  ),
)
@HostApi()
abstract class NativeWakelockApi {
  void toggleWakelock(bool enable);
}

@HostApi()
abstract class NativeBrightnessApi {
  void setBrightness(double brightness);
  double getBrightness();
}
