import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/screens/error_page.dart';
import 'package:smoth_movie_app/common/widgets/list_movie_item_widget.dart';
import 'package:smoth_movie_app/common/widgets/movie_item_skeleton_loading.dart';
import 'package:smoth_movie_app/common/router/app_router.dart';
import 'package:smoth_movie_app/common/router/params/movie_detail_param_model.dart';
import 'package:smoth_movie_app/common/utils/secret/app_secret.dart';

import '../../../../common/utils/enum/kho_phim/kho_phim_movies_state_status.dart';
import '../../../movies/presentation/screens/infinite_gridview_widget.dart';
import '../../../movies/presentation/screens/widgets/category_feed_footer.dart';
import '../../../movies/presentation/screens/widgets/movies_gridview_builder.dart';
import '../../../movies/presentation/screens/widgets/movies_silver_gridview_builder.dart';
import '../bloc/kho_phim_movies/kho_phim_movies_bloc.dart';
import 'kho_phim_no_more_movies_widget.dart';

class InfiniteGridViewMovies extends StatefulWidget {
  const InfiniteGridViewMovies({
    super.key,
    required this.categorySlug,
    required this.countrySlug,
    required this.yearSlug,
    required this.languageSlug,
    this.limit = 30,
  });

  final String categorySlug;
  final String countrySlug;
  final String yearSlug;
  final String languageSlug;
  final int limit;

  @override
  State<InfiniteGridViewMovies> createState() => InfiniteGridViewMoviesState();
}

class InfiniteGridViewMoviesState extends State<InfiniteGridViewMovies> {
  @override
  void initState() {
    super.initState();
    _loadMovies();
  }

  @override
  void didUpdateWidget(covariant InfiniteGridViewMovies oldWidget) {
    super.didUpdateWidget(oldWidget);
    final filtersChanged = oldWidget.countrySlug != widget.countrySlug ||
        oldWidget.languageSlug != widget.languageSlug ||
        oldWidget.categorySlug != widget.categorySlug ||
        oldWidget.yearSlug != widget.yearSlug ||
        oldWidget.limit != widget.limit;
    if (filtersChanged) {
      _loadMovies();
    }
  }

  void handleScrollEnd(ScrollMetrics metrics) {
    if (!InfiniteGridView.isNearScrollEnd(metrics)) return;
    _tryLoadMore();
  }

  KhoPhimMoviesQuery _moviesQuery() {
    return KhoPhimMoviesQuery(
      countrySlug: widget.countrySlug,
      lang: widget.languageSlug,
      categorySlug: widget.categorySlug,
      year: widget.yearSlug,
      limit: widget.limit,
    );
  }

  void _loadMovies() {
    context
        .read<KhoPhimMoviesBloc>()
        .add(KhoPhimMoviesEvent.getMovies(_moviesQuery()));
  }

  void _tryLoadMore() {
    if (!mounted) return;

    final bloc = context.read<KhoPhimMoviesBloc>();
    final state = bloc.state;
    if (state.isEnd || state.isLoadingMore) return;

    bloc.add(KhoPhimMoviesEvent.loadMore(_moviesQuery()));
  }

  bool _footerBuildWhen(
      KhoPhimMoviesState previous, KhoPhimMoviesState current) {
    return previous.isEnd != current.isEnd ||
        previous.isLoadingMore != current.isLoadingMore ||
        previous.loadMoreFailed != current.loadMoreFailed ||
        previous.movies.length != current.movies.length;
  }

  bool _moviesBuildWhen(
    KhoPhimMoviesState previous,
    KhoPhimMoviesState current,
  ) {
    return previous.status != current.status ||
        previous.movies.length != current.movies.length ||
        previous.isLoadingMore != current.isLoadingMore ||
        previous.loadMoreFailed != current.loadMoreFailed ||
        previous.isEnd != current.isEnd;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KhoPhimMoviesBloc, KhoPhimMoviesState>(
      buildWhen: _moviesBuildWhen,
      builder: (context, state) {
        switch (state.status) {
          case KhoPhimMoviesStateStatus.init:
            return const SizedBox.shrink();
          case KhoPhimMoviesStateStatus.error:
            return const ErrorPage();
          case KhoPhimMoviesStateStatus.loading:
            return MoviesGridBuilder(
              itemCount: widget.limit,
              itemBuilder: (_, i) => const MovieItemSkeletonLoading(),
            );
          default:
            if (state.isEnd && state.movies.isEmpty) {
              return const KhoPhimNoMoreMovie();
            }
            return CustomScrollView(
              shrinkWrap: true,
              primary: false,
              slivers: [
                // Gridview of movies
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

                // Footer
                SliverToBoxAdapter(
                  child: BlocBuilder<KhoPhimMoviesBloc, KhoPhimMoviesState>(
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
      },
    );
  }
}
