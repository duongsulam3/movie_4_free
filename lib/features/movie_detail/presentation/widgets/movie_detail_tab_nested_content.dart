import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/nested_scroll_view_detail_movie_widget.dart';
import 'package:smoth_movie_app/core/utils/helper/helper.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/movie_detail.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/widgets/movie_description.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/widgets/movie_detail_bloc_builder_episode_name.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/widgets/tabbar_view_content.dart';

class MovieDetailTabNestedContent extends StatelessWidget {
  const MovieDetailTabNestedContent({super.key, required this.movie});

  final MovieDetailEntity movie;

  @override
  Widget build(BuildContext context) {
    return NestedScrollViewDetailMovieWidget(
      movieDescriptionWidget: MovieDescription(
        movieName: movie.movieInfo.name,
        movieOriginalName: movie.movieInfo.originName,
        episodesBlocBuilder: MovieDetailBlocBuilderEpisodeName(movie: movie),
        movieDescription: movie.movieInfo.content,
        movieEpisodes: movie.movieInfo.episodeTotal == "1"
            ? "Phim Điện Ảnh"
            : movie.movieInfo.episodeCurrent.contains("Hoàn")
                ? movie.movieInfo.episodeCurrent
                : "${movie.movieInfo.episodeCurrent}/${movie.movieInfo.episodeTotal}",
        categories: Helper.getCategories(movie.movieInfo.categories),
        actors: movie.movieInfo.actor.join(", "),
        directors: movie.movieInfo.director.join(", "),
        countries: Helper.getCountries(movie.movieInfo.countries),
      ),
      child: ExpandedTabBarViewContent(
        movie: movie,
        categories: movie.movieInfo.categories,
      ),
    );
  }
}
