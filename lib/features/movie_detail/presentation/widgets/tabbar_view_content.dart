import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/responsive_sized_box.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/movie_detail.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/server_data.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/widgets/tabbar_list_of_episode.dart';

class ExpandedTabBarViewContent extends StatelessWidget {
  const ExpandedTabBarViewContent({
    super.key,
    required this.episodes,
    required this.movie,
  });

  final List<ServerDataEntity> episodes;
  final MovieDetailEntity movie;

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizedBox(
      height: 360,
      child: TabBarView(
        children: [
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: episodes.length,
            itemBuilder: (context, index) {
              return TabBarListOfEpisode(
                movie: movie,
                episodeIndex: index,
              );
            },
          ),
          const Center(child: Text("Đang bảo trì")),
        ],
      ),
    );
  }
}
