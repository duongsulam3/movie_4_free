import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/cached_network/container_with_cached_network_image_provider.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/movie_detail.dart';

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
    //TODO Handle Responsive
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
              height: 120,
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(sHeight / (sHeight / 10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ResponsiveText(
                    text: movie.movieInfo.name,
                    fontSize: 16,
                    textOverflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  ResponsiveText(
                    text: "Chất lượng: ${movie.movieInfo.quality}",
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  ResponsiveText(
                    text: movie.episodes[0].serverData[episodeIndex].name,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  ResponsiveText(
                    text: "Thời lượng: ${movie.movieInfo.time}",
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
