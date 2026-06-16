import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_supper_app_core/core.dart';

import '../../../../common/router/app_router.dart';
import '../../../../common/router/params/movie_detail_param_model.dart';
import '../../../../common/screens/error_page.dart';
import '../../../../common/utils/enum/movies_state_status.dart';
import '../../../../common/utils/secret/app_secret.dart';
import '../../../../common/widgets/list_movie_item_widget.dart';
import '../../../../common/widgets/movie_item_skeleton_loading.dart';
import '../bloc/movies/movies_bloc.dart';
import 'widgets/category_feed_footer.dart';
import 'widgets/movies_gridview_builder.dart';
import 'widgets/movies_silver_gridview_builder.dart';

class InfiniteGridView extends StatefulWidget {
  const InfiniteGridView({
    super.key,
    required this.path,
    this.primary = false,
    this.physics,
    required this.itemCount,
  });

  final String path;
  final bool primary;
  final ScrollPhysics? physics;
  final int itemCount;

  static const double loadMoreThreshold = 200;

  static bool isNearScrollEnd(ScrollMetrics metrics) {
    if (!metrics.hasContentDimensions) return false;
    return metrics.pixels > metrics.maxScrollExtent - loadMoreThreshold;
  }

  @override
  State<InfiniteGridView> createState() => InfiniteGridViewState();
}

class InfiniteGridViewState extends State<InfiniteGridView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  void handleScrollEnd(ScrollMetrics metrics) {
    if (!InfiniteGridView.isNearScrollEnd(metrics)) return;

    // Try load more movies when user scrolls near the end of the list
    _tryLoadMore();
  }

  void _tryLoadMore() {
    if (!mounted) return;

    final bloc = context.read<MoviesBloc>();
    final state = bloc.state;
    if (state.isEnd || state.isLoadingMore) return;

    bloc.add(MoviesEvent.loadMoreCategoryFeed(path: widget.path));
  }

  bool _footerBuildWhen(MoviesState previous, MoviesState current) {
    return previous.isEnd != current.isEnd ||
        previous.isLoadingMore != current.isLoadingMore ||
        previous.loadMoreFailed != current.loadMoreFailed ||
        previous.movies.length != current.movies.length;
  }

  Widget _buildContent(MoviesState state) {
    switch (state.status) {
      case MoviesStateStatus.init:
        return MoviesGridBuilder(
          itemCount: widget.itemCount,
          itemBuilder: (_, i) => const MovieItemSkeletonLoading(),
        );
      case MoviesStateStatus.error:
        return const ErrorPage();
      default:
        if (state.movies.isEmpty) {
          return const Center(child: Text('Không còn phim'));
        }
        return CustomScrollView(
          shrinkWrap: true,
          primary: widget.primary,
          physics: widget.physics,
          slivers: [
            MoviesSilverGridviewBuilder(
              itemCount: state.movies.length,
              itemBuilder: (BuildContext context, int index) {
                final movie = state.movies[index];
                return ListMovieItemWidget(
                  movieUrl: AppSecret.imageUrl + movie.posterUrl,
                  movieName: movie.name,
                  onTap: () => Navigator.of(context).pushNamed(
                    AppRouter.movieDetail,
                    arguments: MovieDetailParamModel(movie: movie),
                  ),
                );
              },
            ),
            SliverToBoxAdapter(
              child: BlocBuilder<MoviesBloc, MoviesState>(
                buildWhen: _footerBuildWhen,
                builder: (context, footerState) {
                  return CategoryFeedFooter(
                    isEnd: footerState.isEnd,
                    isLoadingMore: footerState.isLoadingMore,
                    loadMoreFailed: footerState.loadMoreFailed,
                    onRetry: _tryLoadMore,
                  );
                },
              ),
            ),
          ],
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (_, state) {
        return AnimationStateSwitcher(
          valueKey: state.status,
          child: _buildContent(state),
        );
      },
    );
  }
}
