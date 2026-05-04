import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/responsive/responsive.dart';
import '../error_image_widget.dart';

class ContainerWithCachedNetworkImageProvider extends StatelessWidget {
  const ContainerWithCachedNetworkImageProvider({
    super.key,
    required this.path,
    this.height,
    this.width,
  });
  final String path;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height?.v,
      width: width?.h,
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: CachedNetworkImageProvider(
            path,
            errorListener: (p0) => const Center(child: ErrorImage()),
          ),
        ),
      ),
    );
  }
}
