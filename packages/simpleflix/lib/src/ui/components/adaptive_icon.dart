import 'package:flutter/material.dart';
import '../base/platform_agnostic_widget.dart';

class AdaptiveIcon extends PlatformAgnosticWidget<Icon, Icon> {
  const AdaptiveIcon({
    super.key,
    required this.androidIcon,
    required this.iosIcon,
    this.color = Colors.white,
    this.size = 24.0,
  });

  final IconData androidIcon;
  final IconData iosIcon;
  final Color color;
  final double size;

  @override
  Icon buildAndroidWidget(BuildContext context) {
    return Icon(androidIcon, color: color, size: size);
  }

  @override
  Icon buildIOSWidget(BuildContext context) {
    return Icon(iosIcon, color: color, size: size);
  }
}
