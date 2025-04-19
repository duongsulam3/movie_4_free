import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/nested_scroll_view_detail_movie_widget.dart';
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
    return NestedScrollViewDetailMovieWidget(
      movieDescriptionWidget: NguoncMovieDescription(
        movie: movie,
        sHeight: sHeight,
        sWidth: sWidth,
      ),
      child: TabBarView(
        children: <Widget>[
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: movie.episodes[0].items.length,
            itemBuilder: (context, i) => NguoncEpisodesItem(
              itemIndex: i,
              sHeight: sHeight,
              movie: movie,
            ),
          ),
          const Text("Phim tương tự"),
        ],
      ),
    );
  }
}
