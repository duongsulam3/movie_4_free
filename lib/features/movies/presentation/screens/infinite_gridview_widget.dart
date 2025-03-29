import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/widgets/progress_indicator_custom.dart';
import 'package:smoth_movie_app/core/router/app_router.dart';
import 'package:smoth_movie_app/core/router/params/movie_detail_param_model.dart';
import 'package:smoth_movie_app/core/utils/enum/movies_state_status.dart';
import 'package:smoth_movie_app/common/screens/error_page.dart';
import 'package:smoth_movie_app/common/widgets/list_movie_item_widget.dart';
import 'package:smoth_movie_app/features/movies/presentation/bloc/movies/movies_bloc.dart';
import 'package:smoth_movie_app/features/movies/presentation/screens/widgets/load_more_container.dart';
import 'package:smoth_movie_app/core/utils/helper/helper.dart';

class InfiniteGridView extends StatefulWidget {
  const InfiniteGridView({
    super.key,
    required this.path,
    required this.scrollController,
    this.primary = false,
    this.physics,
  });
  final String path;
  final bool primary;
  final ScrollPhysics? physics;
  final ScrollController scrollController;

  @override
  State<InfiniteGridView> createState() => _InfiniteGridViewState();
}

class _InfiniteGridViewState extends State<InfiniteGridView>
    with AutomaticKeepAliveClientMixin {
  //** MARKED NOT WILL NOT RELOAD WHEN CHANGE TAB */
  @override
  bool get wantKeepAlive => true;
  //** MARKED NOT WILL NOT RELOAD WHEN CHANGE TAB */

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (_, state) {
        switch (state.status) {
          case MoviesStateStatus.init:
            return const Center(child: ProgressIndicatorCustom());
          case MoviesStateStatus.error:
            return const ErrorPage();
          case MoviesStateStatus.success:
            if (state.movies.isEmpty) {
              return const Center(child: Text('No more movies'));
            }
            return CustomScrollView(
              controller: widget.scrollController,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              primary: widget.primary,
              physics: widget.physics,
              slivers: [
                SliverGrid.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    mainAxisExtent: 180,
                  ),
                  itemCount: state.movies.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListMovieItemWidget(
                      onTap: () => Navigator.of(context).pushNamed(
                        AppRouter.movieDetail,
                        arguments: MovieDetailParamModel(
                          slug: state.movies[index].slug,
                        ),
                      ),
                      movie: state.movies[index],
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
