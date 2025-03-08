import 'package:flutter/material.dart';

class ResponsiveAssetImage extends StatelessWidget {
  const ResponsiveAssetImage({
    super.key,
    required this.path,
    this.width,
    this.height,
  });

  final String path;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.of(context).size.height;
    final sWidth = MediaQuery.of(context).size.width;
    return Image.asset(
      path,
      height: height == null ? null : sHeight / (sHeight / height!),
      width: width == null ? null : sWidth / (sWidth / width!),
    );
  }
}
