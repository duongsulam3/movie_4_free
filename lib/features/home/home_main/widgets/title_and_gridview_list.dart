import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/features/home/presentation/widgets/row_title_and_more.dart';
import 'package:smoth_movie_app/features/movies/presentation/bloc/movies/movies_bloc.dart';
import 'package:smoth_movie_app/features/movies/presentation/screens/bloc_builder_gridview.dart';
import 'package:smoth_movie_app/init_dependencies.dart';

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

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MoviesBloc>(
      create: (context) => serviceLocator()
        ..add(GetListMovies(
          path: path,
          limit: limit,
          isRefresh: false,
        )),
      child: Padding(
        padding: EdgeInsets.all(sHeight / (sHeight / 5)),
        child: Column(
          spacing: 10,
          children: [
            RowTitleAndMore(
              title: title,
              onTap: () => tabController.animateTo(tabIndex),
            ),
            BlocBuilderGridview(itemCount: limit),
          ],
        ),
      ),
    );
  }
}
