import 'package:flutter/material.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/widgets/detail_page_tabbar.dart';
import 'package:smoth_movie_app/features/nguonc_movie_detail/domain/entity/nguonc_movie_entity.dart';
import 'package:smoth_movie_app/features/nguonc_movie_detail/presentation/widget/nguonc_episodes_item.dart';
import 'package:smoth_movie_app/features/nguonc_movie_detail/presentation/widget/nguonc_movie_description.dart';

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
    return NestedScrollView(
      scrollDirection: Axis.vertical,
      physics: const AlwaysScrollableScrollPhysics(),
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverToBoxAdapter(
          child: NguoncMovieDescription(
            movie: movie,
            sHeight: sHeight,
            sWidth: sWidth,
          ),
        ),
        const SliverToBoxAdapter(child: DetailPageTabBar()),
      ],
      body: TabBarView(
        children: <Widget>[
          ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: movie.episodes[0].items.length,
            itemBuilder: (context, i) {
              return NguoncEpisodesItem(
                itemIndex: i,
                sHeight: sHeight,
                movie: movie,
              );
            },
          ),
          const Text("Phim tương tự"),
        ],
      ),
    );
  }
}
