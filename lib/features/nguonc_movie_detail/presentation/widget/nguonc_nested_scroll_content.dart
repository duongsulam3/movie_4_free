import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/nested_scroll_view_detail_movie_widget.dart';
import 'package:smoth_movie_app/core/constants/app_constants.dart';
import 'package:smoth_movie_app/core/utils/helper/helper.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/widgets/movie_description.dart';
import 'package:smoth_movie_app/features/nguonc_movie_detail/domain/entity/nguonc_movie_entity.dart';
import 'package:smoth_movie_app/features/nguonc_movie_detail/presentation/widget/nguonc_episode_bloc_builder_name.dart';
import 'package:smoth_movie_app/features/nguonc_movie_detail/presentation/widget/nguonc_tabbar_view_content.dart';

class NguoncNestedScrollContent extends StatelessWidget {
  const NguoncNestedScrollContent({
    super.key,
    required this.movie,
    required this.sHeight,
    required this.sWidth,
  });

  final NguoncMovieEntity movie;
  final double sHeight;
  final double sWidth;

  @override
  Widget build(BuildContext context) {
    return NestedScrollViewDetailMovieWidget(
      movieDescriptionWidget: MovieDescription(
        movieName: movie.name,
        movieOriginalName: movie.originalName,
        episodesBlocBuilder: NguoncEpisodeBlocBuilderName(movie: movie),
        movieDescription: movie.description,
        movieEpisodes: movie.totalEpisodes == 1
            ? "Phim Điện Ảnh"
            : movie.currentEpisode.contains("Hoàn")
                ? movie.currentEpisode
                : "${movie.currentEpisode}/${movie.totalEpisodes}",
        categories: Helper.getNguoncCategories(movie.categories[1]),
        actors: movie.casts,
        directors: movie.director,
        countries: Helper.getNguoncCountries(movie.categories[3].list),
      ),
      child: NguoncTabBarViewContent(
        movie: movie,
        sHeight: sHeight,
        category: movie.categories[1].group.name == "Thể loại"
            ? movie.categories[1].list.isEmpty
                ? AppConstants.noData
                : movie.categories[1].list[0].name
            : movie.categories[2].list.isEmpty
                ? AppConstants.noData
                : movie.categories[2].list[0].name,
      ),
    );
  }
}
