import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/cached_network/cached_network_image.dart';
import 'package:smoth_movie_app/common/widgets/responsive_sized_box.dart';
import 'package:smoth_movie_app/core/secret/app_secret.dart';
import 'package:smoth_movie_app/features/search/presentation/widgets/search_item_content.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';

class SearchItemWidget extends StatelessWidget {
  const SearchItemWidget({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.movie,
  });

  final double screenWidth;
  final double screenHeight;

  final MovieItemEntity movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: screenHeight / (screenHeight / 180),
      width: screenWidth,
      child: Row(
        children: [
          //** Image */
          CachedNetworkImageWidget(
            url: AppSecret.imageUrl + movie.posterUrl,
            width: 120,
            height: 180,
            memCacheWidth: 120,
            memCacheHeight: 180,
          ),
          const ResponsiveSizedBox(width: 10),
          //** Content */
          Expanded(
            child: SearchItemContent(
              screenHeight: screenHeight,
              movie: movie,
            ),
          ),
        ],
      ),
    );
  }
}
