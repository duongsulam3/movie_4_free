import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/cached_network/container_with_cached_network_image_provider.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/widgets/item_info.dart';

class TabBarListItem extends StatelessWidget {
  const TabBarListItem({
    super.key,
    required this.sHeight,
    required this.imagePath,
    required this.movieName,
    required this.movieQuality,
    required this.episodeName,
    required this.episodeTime,
    required this.onTap,
  });

  final double sHeight;
  final String imagePath;
  final String movieName;
  final String movieQuality;
  final String episodeName;
  final String episodeTime;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
                // path: movie.movieInfo.thumbUrl,
                path: imagePath,
              ),
            ),
            Expanded(
              flex: 5,
              child: ItemInfo(
                movieName: movieName,
                movieQuality: movieQuality,
                episodeName: episodeName,
                episodeTime: episodeTime,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
