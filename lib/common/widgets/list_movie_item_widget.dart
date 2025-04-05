import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/cached_network/cached_network_image.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';
import 'package:smoth_movie_app/core/utils/secret/app_secret.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';

class ListMovieItemWidget extends StatelessWidget {
  const ListMovieItemWidget({
    super.key,
    required this.movie,
    required this.onTap,
    this.memCacheHeight = 300,
    this.memCacheWidth = 300,
  });
  final MovieItemEntity movie;
  final void Function() onTap;
  final int memCacheHeight;
  final int memCacheWidth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        spacing: 5,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            child: CachedNetworkImageWidget(
              url: AppSecret.imageUrl + movie.posterUrl,
              height: 180,
              width: double.infinity,
              memCacheHeight: memCacheHeight,
              memCacheWidth: memCacheWidth,
            ),
          ),
          Expanded(
            child: ResponsiveText(
              text: movie.name,
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
