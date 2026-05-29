import 'package:flutter_supper_app_core/core.dart';

import '../../../../common/widgets/responsive_sized_box.dart';
import '../../../movies/presentation/screens/bloc_builder_movies_sort_by_time.dart';
import '../../../movies/presentation/screens/infinite_gridview_widget.dart';
import '../../presentation/scope/categories_tab_scope.dart';

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
    return CategoriesTabScope(
      path: widget.path,
      child: SingleChildScrollView(
        controller: widget.scrollController,
        child: Column(
          spacing: 20.v,
          children: [
            const BlocBuilderMoviesSortByTime(),
            Padding(
              padding: EdgeInsets.only(left: 5.h, right: 5.h),
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
