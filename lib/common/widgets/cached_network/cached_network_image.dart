import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/error_image_widget.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  final String url;
  final double? height;
  final double? width;
  final int? memCacheHeight;
  final int? memCacheWidth;

  const CachedNetworkImageWidget({
    super.key,
    required this.url,
    this.height,
    this.width,
    this.memCacheHeight,
    this.memCacheWidth,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      memCacheHeight: memCacheHeight,
      memCacheWidth: memCacheWidth,
      fit: BoxFit.fill,
      errorWidget: (context, url, error) {
        log("Ảnh bị lỗi: $url");
        return const Center(child: ErrorImage());
      },
      progressIndicatorBuilder: (context, url, progress) => const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
