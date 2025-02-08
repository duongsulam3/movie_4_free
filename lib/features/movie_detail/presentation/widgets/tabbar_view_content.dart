import 'package:flutter/material.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/movie_detail.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/server_data.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/widgets/tabbar_list_of_episode.dart';

class ExpandedTabBarViewContent extends StatefulWidget {
  const ExpandedTabBarViewContent({
    super.key,
    required this.episodes,
    required this.movie,
  });

  final List<ServerDataEntity> episodes;
  final MovieDetailEntity movie;

  @override
  State<ExpandedTabBarViewContent> createState() =>
      _ExpandedTabBarViewContentState();
}

class _ExpandedTabBarViewContentState extends State<ExpandedTabBarViewContent>
    with TickerProviderStateMixin {
  // TabController? tabController;

  @override
  void initState() {
    // tabController = TabController(length: 2, vsync: this, initialIndex: 1);
    super.initState();
  }

  @override
  void dispose() {
    // tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        // controller: tabController,
        children: [
          ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: widget.episodes.length,
            itemBuilder: (context, index) {
              return TabBarListOfEpisode(
                movie: widget.movie,
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
