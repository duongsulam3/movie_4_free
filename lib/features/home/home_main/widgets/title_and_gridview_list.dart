import 'package:flutter/material.dart';
import 'package:smoth_movie_app/features/home/presentation/scope/title_grid_movies_scope.dart';
import 'package:smoth_movie_app/features/home/presentation/widgets/row_title_and_more.dart';
import 'package:smoth_movie_app/features/movies/presentation/screens/bloc_builder_gridview.dart';

class TitleAndGridViewList extends StatelessWidget {
  const TitleAndGridViewList({
    super.key,
    required this.sHeight,
    required this.title,
    required this.path,
    required this.tabController,
    required this.tabIndex,
    this.limit = 9,
  });

  final double sHeight;
  final String title;
  final String path;
  final TabController tabController;
  final int tabIndex;
  final int limit;

  void _onTap() {
    tabController.animateTo(tabIndex);
  }

  @override
  Widget build(BuildContext context) {
    return TitleGridMoviesScope(
      path: path,
      limit: limit,
      child: Padding(
        padding: EdgeInsets.all(sHeight / (sHeight / 5)),
        child: Column(
          spacing: 10,
          children: [
            RowTitleAndMore(
              title: title,
              onTap: _onTap,
            ),
            BlocBuilderGridview(itemCount: limit),
          ],
        ),
      ),
    );
  }
}
