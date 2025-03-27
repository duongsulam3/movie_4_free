import 'package:flutter/material.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/movie_detail.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/widgets/tabbar_list_of_episode.dart';

class ExpandedTabBarViewContent extends StatelessWidget {
  const ExpandedTabBarViewContent({super.key, required this.movie});

  final MovieDetailEntity movie;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: <Widget>[
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: movie.episodes[0].serverData.length,
          itemBuilder: (context, index) {
            return TabBarListOfEpisode(
              movie: movie,
              episodeIndex: index,
            );
          },
        ),
        const Center(child: Text("Đang bảo trì")),
      ],
    );
  }
}
