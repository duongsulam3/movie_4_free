import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/movie_detail.dart';

class ItemInfo extends StatelessWidget {
  const ItemInfo({
    super.key,
    required this.movie,
    required this.episodeIndex,
  });

  final MovieDetailEntity movie;
  final int episodeIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: ResponsiveText(
              text: movie.movieInfo.name,
              fontSize: 16,
              textOverflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          Expanded(
            child: ResponsiveText(
              text: "Chất lượng: ${movie.movieInfo.quality}",
              fontSize: 16,
              fontWeight: FontWeight.w400,
              maxLines: 1,
            ),
          ),
          Expanded(
            child: ResponsiveText(
              text: movie.episodes[0].serverData[episodeIndex].name,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              maxLines: 1,
            ),
          ),
          Expanded(
            child: ResponsiveText(
              text: "Thời lượng: ${movie.movieInfo.time}",
              fontSize: 16,
              fontWeight: FontWeight.w400,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}