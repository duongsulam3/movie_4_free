import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:simpleflix/src/ui/base/platform_agnostic_widget.dart';

class AdaptiveIconButton
    extends PlatformAgnosticWidget<IconButton, CupertinoButton> {
  const AdaptiveIconButton({
    super.key,
    required this.androidIcon,
    required this.iosIcon,
    required this.onPressed,
    this.color = Colors.white,
    this.size = 24.0,
  });

  final IconData androidIcon;
  final IconData iosIcon;
  final VoidCallback onPressed;
  final Color color;
  final double size;

  @override
  IconButton buildAndroidWidget(BuildContext context) {
    return IconButton(
      iconSize: size,
      padding: EdgeInsets.zero,
      icon: Icon(androidIcon, color: color),
      onPressed: onPressed,
    );
  }

  @override
  CupertinoButton buildIOSWidget(BuildContext context) {
    return CupertinoButton(
      sizeStyle: CupertinoButtonSize.medium,
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      child: Icon(iosIcon, color: color, size: size),
    );
  }
}
