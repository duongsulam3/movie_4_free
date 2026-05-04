import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smoth_movie_core/core.dart';

import '../error_image_widget.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  final String url;
  final double? height;
  final double? width;
  final int memCacheHeight;
  final int memCacheWidth;

  const CachedNetworkImageWidget({
    super.key,
    required this.url,
    this.height,
    this.width,
    this.memCacheHeight = 200,
    this.memCacheWidth = 200,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      height: height?.v,
      width: width?.h,
      memCacheHeight: memCacheHeight,
      memCacheWidth: memCacheWidth,
      fit: BoxFit.fill,
      errorWidget: (context, url, error) {
        log("Ảnh bị lỗi: $url");
        return const Center(child: ErrorImage());
      },
    );
  }
}
