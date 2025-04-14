import 'package:flutter/cupertino.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';
import 'package:smoth_movie_app/common/widgets/search_play_icon_widget.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';

class SearchItemContent extends StatelessWidget {
  const SearchItemContent({
    super.key,
    required this.screenHeight,
    required this.movie,
  });

  final double screenHeight;
  final MovieItemEntity movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: screenHeight / (screenHeight / 5),
      children: [
        ResponsiveText(
          text: movie.name,
          fontSize: 16,
          textOverflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        ResponsiveText(
          text:
              "${movie.year} | ${movie.countries[0].name} | ${movie.categories[0].name}",
          fontSize: 12,
        ),
        ResponsiveText(
          text: movie.lang,
          fontSize: 12,
        ),
        ResponsiveText(
          text: "Chất lượng: ${movie.quality}",
          fontSize: 12,
        ),
        ResponsiveText(
          text: "Thời lượng: ${movie.time}",
          fontSize: 12,
        ),
        ResponsiveText(
          text: movie.episodeCurrent,
          fontSize: 12,
        ),
        const Spacer(),
        const SearchPlayIcon()
      ],
    );
  }
}
