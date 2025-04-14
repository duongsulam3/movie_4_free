import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/cached_network/container_with_cached_network_image_provider.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/movie_detail.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/widgets/item_info.dart';

class TabBarListItem extends StatelessWidget {
  const TabBarListItem({
    super.key,
    required this.sHeight,
    required this.movie,
    required this.episodeIndex,
  });

  final double sHeight;
  final MovieDetailEntity movie;
  final int episodeIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sHeight / (sHeight / 120),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xff575966),
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: ContainerWithCachedNetworkImageProvider(
              path: movie.movieInfo.thumbUrl,
            ),
          ),
          Expanded(
            flex: 5,
            child: ItemInfo(movie: movie, episodeIndex: episodeIndex),
          ),
        ],
      ),
    );
  }
}
