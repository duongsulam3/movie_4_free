import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/nested_scroll_view_detail_movie_widget.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/movie_detail.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/widgets/movie_description.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/widgets/tabbar_view_content.dart';

class MovieDetailTabNestedContent extends StatelessWidget {
  const MovieDetailTabNestedContent({super.key, required this.movie});

  final MovieDetailEntity movie;

  @override
  Widget build(BuildContext context) {
    return NestedScrollViewDetailMovieWidget(
      movieDescriptionWidget: MovieDescription(movie: movie),
      child: ExpandedTabBarViewContent(
        movie: movie,
        categories: movie.movieInfo.categories,
      ),
    );
  }
}
