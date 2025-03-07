import 'package:flutter/material.dart';

class ResponsiveSizedBox extends StatelessWidget {
  const ResponsiveSizedBox({super.key, this.width, this.height, this.child});
  final double? width;
  final double? height;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.of(context).size.height;
    final sWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width == null ? null : sWidth / (sWidth / width!),
      height: height == null ? null : sHeight / (sHeight / height!),
      child: child,
    );
  }
}
