import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/router/app_router.dart';
import '../../../../common/router/params/movie_detail_param_model.dart';
import '../../../../common/screens/error_page.dart';
import '../../../../common/utils/enum/movies_state_status.dart';
import '../../../../common/utils/secret/app_secret.dart';
import '../../../../common/widgets/list_movie_item_widget.dart';
import '../../../../common/widgets/movie_item_skeleton_loading.dart';
import '../bloc/movies/movies_bloc.dart';
import 'widgets/load_more_container.dart';
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

  @override
  State<InfiniteGridView> createState() => _InfiniteGridViewState();
}

class _InfiniteGridViewState extends State<InfiniteGridView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  void _onLoadMore(BuildContext context, String path) {
    context
        .read<MoviesBloc>()
        .add(MoviesEvent.loadMoreCategoryFeed(path: path));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (_, state) {
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
              scrollDirection: Axis.vertical,
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
                SliverList(
                  delegate: SliverChildListDelegate([
                    GestureDetector(
                      onTap: () => _onLoadMore(context, widget.path),
                      child: const LoadMoreContainer(),
                    ),
                  ]),
                ),
              ],
            );
        }
      },
    );
  }
}
