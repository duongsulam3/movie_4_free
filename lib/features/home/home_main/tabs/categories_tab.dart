import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/responsive_sized_box.dart';
import 'package:smoth_movie_app/features/movies/presentation/screens/bloc_builder_movies_sort_by_time.dart';
import 'package:smoth_movie_app/features/movies/presentation/screens/infinite_gridview_widget.dart';
import 'package:smoth_movie_app/features/home/presentation/scope/categories_tab_scope.dart';

class CategoriesTab extends StatefulWidget {
  const CategoriesTab({
    super.key,
    required this.scrollController,
    required this.path,
    this.limit = 30,
  });

  final ScrollController scrollController;
  final String path;
  final int limit;

  @override
  State<CategoriesTab> createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final sHeight = MediaQuery.of(context).size.height;
    return CategoriesTabScope(
      path: widget.path,
      limit: widget.limit,
      child: SingleChildScrollView(
        controller: widget.scrollController,
        child: Column(
          spacing: sHeight / (sHeight / 20),
          children: [
            const BlocBuilderMoviesSortByTime(),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: InfiniteGridView(
                path: widget.path,
                itemCount: widget.limit,
              ),
            ),

            // Extra spacing for the bottom navigation bar.
            const ResponsiveSizedBox(height: 80)
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
