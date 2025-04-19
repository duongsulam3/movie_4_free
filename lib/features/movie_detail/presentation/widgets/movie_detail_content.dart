import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/movie_detail_page_widget.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/movie_detail.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/widgets/movie_detail_tabbar.dart';

class MovieDetailContent extends StatelessWidget {
  const MovieDetailContent({super.key, required this.movie});

  final MovieDetailEntity movie;

  @override
  Widget build(BuildContext context) {
    return MovieDetailPageWidget(
      child: MovieDetailTabBar(movie: movie),
    );
  }
}
