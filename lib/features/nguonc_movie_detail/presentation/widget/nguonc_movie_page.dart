import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/movie_default_tab_page.dart';
import 'package:smoth_movie_app/common/widgets/movie_detail_page_widget.dart';
import 'package:smoth_movie_app/common/widgets/responsive_sized_box.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/widgets/icon_back_button.dart';
import 'package:smoth_movie_app/features/nguonc_movie_detail/domain/entity/nguonc_movie_entity.dart';
import 'package:smoth_movie_app/features/nguonc_movie_detail/presentation/widget/nguonc_nested_scroll_content.dart';
import 'package:smoth_movie_app/features/nguonc_movie_detail/presentation/widget/nguonc_player_bloc_builder.dart';

class NguoncMoviePage extends StatelessWidget {
  const NguoncMoviePage({super.key, required this.movie});

  final NguoncMovieEntity movie;

  @override
  Widget build(BuildContext context) {
    final sWidth = MediaQuery.of(context).size.width;
    final sHeight = MediaQuery.of(context).size.height;
    return MovieDetailPageWidget(
      child: MovieDefaultTabPage(
              sHeight: sHeight,
              sWidth: sWidth,
              player: NguoncPlayerBlocBuilder(
                movie: movie,
                sWidth: sWidth,
              ),
              leadingIcon: const ResponsiveSizedBox(
                height: 20,
                width: 20,
                child: FittedBox(child: IconBackButton()),
              ),
              nestedScrollContent: NguoncNestedScrollContent(
                movie: movie,
                sHeight: sHeight,
                sWidth: sWidth,
              ),
            ),
    );
  }
}
