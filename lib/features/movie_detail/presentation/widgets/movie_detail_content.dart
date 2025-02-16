import 'package:flutter/material.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/movie_detail.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/server_data.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/widgets/movie_detail_tabbar.dart';

class MovieDetailContent extends StatelessWidget {
  const MovieDetailContent({
    super.key,
    required this.initEpisode,
    required this.movie,
    required this.episodes,
  });

  final String initEpisode;
  final MovieDetailEntity movie;
  final List<ServerDataEntity> episodes;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: MovieDetailTabBar(
          initEpisode: initEpisode,
          movie: movie,
          episodes: episodes,
        ),
      ),
    );
  }
}
