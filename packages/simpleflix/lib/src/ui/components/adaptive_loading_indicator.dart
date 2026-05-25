import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:simpleflix/src/ui/base/platform_agnostic_widget.dart';

class AdaptiveLoadingIndicator extends PlatformAgnosticWidget<CircularProgressIndicator, CupertinoActivityIndicator> {
  const AdaptiveLoadingIndicator({super.key});

  // Cấu hình chung cho cả 2 nền tảng
  static const Color color = Colors.red;

  // Cấu hình riêng cho Android
  static const double androidStrokeWidth = 0.8;

  // Cấu hình riêng cho iOS
  static const double iosRadius = 12.0;

  @override
  CircularProgressIndicator buildAndroidWidget(BuildContext context) {
    return const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(color),
      strokeWidth: androidStrokeWidth,
    );
  }

  @override
  CupertinoActivityIndicator buildIOSWidget(BuildContext context) {
    return const CupertinoActivityIndicator(radius: iosRadius, color: color);
  }
}
