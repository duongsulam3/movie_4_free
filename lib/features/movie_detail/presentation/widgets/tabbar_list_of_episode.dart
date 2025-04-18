import 'package:flutter/cupertino.dart';
import 'package:smoth_movie_app/core/utils/helper/helper.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/movie_detail.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/widgets/tabbar_list_item.dart';

class TabBarListOfEpisode extends StatelessWidget {
  const TabBarListOfEpisode({
    super.key,
    required this.movie,
    required this.episodeIndex,
  });

  final MovieDetailEntity movie;
  final int episodeIndex;

  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.of(context).size.height;
    // final sWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => Helper.updateUrlEvent(
        context,
        movie.episodes[0].serverData[episodeIndex].linkM3U8,
        movie.episodes[0].serverData[episodeIndex].name,
      ),
      child: TabBarListItem(
        sHeight: sHeight,
        movie: movie,
        episodeIndex: episodeIndex,
      ),
    );
  }
}
