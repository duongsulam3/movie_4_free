import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/tab_listview_episodes_widget.dart';
import 'package:smoth_movie_app/core/constants/app_constants.dart';
import 'package:smoth_movie_app/core/utils/helper/helper.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/widgets/tabbar_list_item.dart';
import 'package:smoth_movie_app/features/nguonc_movie_detail/domain/entity/nguonc_movie_entity.dart';
import 'package:smoth_movie_app/features/nguonc_movie_detail/presentation/widget/nguonc_similar_movies.dart';

class NguoncTabBarViewContent extends StatelessWidget {
  const NguoncTabBarViewContent({
    super.key,
    required this.movie,
    required this.sHeight,
    required this.category,
  });

  final NguoncMovieEntity movie;
  final double sHeight;
  final String category;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: <Widget>[
        TabListViewEpisodes(
          sHeight: sHeight,
          itemCount: movie.episodes[0].items.length,
          itemBuilder: (context, i) => TabBarListItem(
            onTap: () => Helper.nguoncUpdateUrlEvent(
              context,
              movie.episodes[0].items[i].embed,
              movie.episodes[0].items[i].name,
            ),
            sHeight: sHeight,
            imagePath: movie.thumbUrl,
            movieName: movie.name,
            movieQuality: movie.quality,
            episodeName: movie.episodes[0].items[i].name.contains("ull")
                ? AppConstants.phimLeMotTap
                : movie.episodes[0].items[i].name,
            episodeTime: movie.time,
          ),
        ),
        NguoncSimilarMovies(category: category, watchingMovieSlug: movie.slug),
      ],
    );
  }
}
