import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';
import 'package:smoth_movie_app/common/widgets/search_play_icon_widget.dart';
import 'package:smoth_movie_app/features/nguonc_movies/domain/entity/nguonc_movie_item_entity.dart';

class NguoncSearchItemContent extends StatelessWidget {
  const NguoncSearchItemContent({
    super.key,
    required this.screenHeight,
    required this.movie,
    required this.modifiedTime,
  });

  final double screenHeight;
  final NguoncMovieItemEntity movie;
  final String modifiedTime;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: screenHeight / (screenHeight / 5),
        children: [
          ResponsiveText(
            text: movie.name,
            fontSize: 12,
            textOverflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          ResponsiveText(
            text: movie.originalName,
            fontSize: 12,
            textOverflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          ResponsiveText(
            text: "Cập nhật lúc: $modifiedTime",
            fontSize: 12,
            textOverflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          ResponsiveText(
            text: movie.language,
            fontSize: 12,
            textOverflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          ResponsiveText(
            text: "Chất lượng: ${movie.quality}",
            fontSize: 12,
            textOverflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          ResponsiveText(
            text: movie.currentEpisode == "FULL"
                ? "Phim lẻ"
                : movie.currentEpisode,
            fontSize: 12,
            textOverflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          const Spacer(),
          const SearchPlayIcon(),
        ],
      ),
    );
  }
}