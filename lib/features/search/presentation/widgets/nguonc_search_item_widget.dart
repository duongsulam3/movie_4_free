import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/cached_network/cached_network_image.dart';
import 'package:smoth_movie_app/common/widgets/responsive_sized_box.dart';
import 'package:smoth_movie_app/features/nguonc_search_movies/domain/entity/nguonc_movie_item_entity.dart';
import 'package:smoth_movie_app/features/search/presentation/widgets/nguonc_search_item_content.dart';

class SearchNguoncListViewItem extends StatelessWidget {
  const SearchNguoncListViewItem({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.movie,
    required this.modifiedTime,
  });

  final double screenHeight;
  final double screenWidth;
  final NguoncMovieItemEntity movie;
  final String modifiedTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight / (screenHeight / 180),
      width: double.infinity,
      color: Colors.transparent,
      child: Row(
        children: <Widget>[
          Hero(
            tag: movie.slug,
            child: CachedNetworkImageWidget(
              url: movie.thumbUrl,
              height: 180,
              width: 120,
              memCacheWidth: 300,
              memCacheHeight: 300,
            ),
          ),
          const ResponsiveSizedBox(width: 10),
          NguoncSearchItemContent(
            screenHeight: screenHeight,
            movie: movie,
            modifiedTime: modifiedTime,
          ),
        ],
      ),
    );
  }
}
