import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/error_image_widget.dart';

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
    final sHeight = MediaQuery.of(context).size.height;
    final sWidth = MediaQuery.of(context).size.width;
    return Container(
      height: height == null ? null : sHeight / (sHeight / height!),
      width: width == null ? null : sWidth / (sWidth / width!),
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        image: DecorationImage(
          image: CachedNetworkImageProvider(
            path,
            errorListener: (p0) => const Center(
              child: ErrorImage(),
            ),
          ),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
