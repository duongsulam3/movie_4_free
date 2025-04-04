import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/widgets/movie_item_skeleton_loading.dart';
import 'package:smoth_movie_app/core/router/app_router.dart';
import 'package:smoth_movie_app/core/router/params/movie_detail_param_model.dart';
import 'package:smoth_movie_app/core/utils/enum/movies_state_status.dart';
import 'package:smoth_movie_app/common/screens/error_page.dart';
import 'package:smoth_movie_app/common/widgets/list_movie_item_widget.dart';
import 'package:smoth_movie_app/core/utils/helper/helper.dart';
import 'package:smoth_movie_app/features/movies/presentation/bloc/movies/movies_bloc.dart';
import 'package:smoth_movie_app/features/movies/presentation/screens/widgets/load_more_container.dart';
import 'package:smoth_movie_app/features/movies/presentation/screens/widgets/movies_gridview_builder.dart';
import 'package:smoth_movie_app/features/movies/presentation/screens/widgets/movies_silver_gridview_builder.dart';

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
                    return ListMovieItemWidget(
                      movie: state.movies[index],
                      onTap: () => Navigator.of(context).pushNamed(
                        AppRouter.movieDetail,
                        arguments: MovieDetailParamModel(
                          slug: state.movies[index].slug,
                        ),
                      ),
                    );
                  },
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      GestureDetector(
                        onTap: () => Helper.loadMoreInfiniteMovies(
                          context,
                          widget.path,
                        ),
                        child: const LoadMoreContainer(),
                      ),
                    ],
                  ),
                ),
              ],
            );
        }
      },
    );
  }
}
