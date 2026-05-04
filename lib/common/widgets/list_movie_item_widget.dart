import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';

import '../../core/utils/responsive/responsive.dart';
import 'cached_network/cached_network_image.dart';

class ListMovieItemWidget extends StatelessWidget {
  const ListMovieItemWidget({
    super.key,
    required this.onTap,
    this.memCacheHeight = 300,
    this.memCacheWidth = 300,
    required this.movieUrl,
    required this.movieName,
  });
  final void Function() onTap;
  final int memCacheHeight;
  final int memCacheWidth;
  final String movieUrl;
  final String movieName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        spacing: 6.v,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            child: CachedNetworkImageWidget(
              url: movieUrl,
              height: 168,
              width: double.infinity,
              memCacheHeight: memCacheHeight,
              memCacheWidth: memCacheWidth,
            ),
          ),
          Expanded(
            child: ResponsiveText(
              text: movieName,
              maxLines: 2,
              fontSize: 12,
              textColor: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
