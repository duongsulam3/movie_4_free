import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/movie_default_tab_page.dart';
import 'package:smoth_movie_app/common/widgets/responsive_sized_box.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/movie_detail.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/widgets/icon_back_button.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/widgets/movie_detail_tab_nested_content.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/widgets/movie_player_bloc_builder.dart';

class MovieDetailTabBar extends StatelessWidget {
  const MovieDetailTabBar({super.key, required this.movie});

  final MovieDetailEntity movie;

  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.of(context).size.height;
    final sWidth = MediaQuery.of(context).size.width;
    return MovieDefaultTabPage(
      sHeight: sHeight,
      sWidth: sWidth,
      player: BlocBuilderMoviePlayer(movie: movie, sWidth: sWidth),
      leadingIcon: const ResponsiveSizedBox(
        height: 20,
        width: 20,
        child: FittedBox(child: IconBackButton()),
      ),
      nestedScrollContent: MovieDetailTabNestedContent(movie: movie),
    );
  }
}
