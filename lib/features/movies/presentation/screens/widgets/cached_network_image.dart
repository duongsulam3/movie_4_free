import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:smoth_movie_app/common/widgets/error_image_widget.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  final String url;
  const CachedNetworkImageWidget({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      width: double.maxFinite,
      fit: BoxFit.fill,
      errorWidget: (context, url, error) => const Center(
        child: ErrorImage(),
      ),
      progressIndicatorBuilder: (context, url, progress) => const Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}
