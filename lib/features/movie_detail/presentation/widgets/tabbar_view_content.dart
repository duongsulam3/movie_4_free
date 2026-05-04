import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/widgets/tab_listview_episodes_widget.dart';
import 'package:smoth_movie_app/common/core/utils/helper/helper.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/category.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/movie_detail.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/bloc/detail_movie/detail_movie_bloc.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/widgets/tabbar_list_item.dart';
import 'package:smoth_movie_app/features/movies/presentation/screens/similar_movies.dart';
import 'package:smoth_movie_app/features/movies/presentation/bloc/similar_movies/similar_movies_bloc.dart';
import 'package:smoth_movie_app/common/di/init_dependencies.dart';

class ExpandedTabBarViewContent extends StatelessWidget {
  const ExpandedTabBarViewContent({
    super.key,
    required this.movie,
    required this.categories,
  });

  final MovieDetailEntity movie;
  final List<CategoryEntity> categories;

  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.of(context).size.height;
    return TabBarView(
      children: <Widget>[
        //** NEXT EPISODES TAB */
        BlocBuilder<DetailMovieBloc, DetailMovieState>(
          buildWhen: (p, c) => p.passingSlug != c.passingSlug,
          builder: (context, state) {
            return TabListViewEpisodes(
              sHeight: sHeight,
              itemCount: movie.episodes[0].serverData.length,
              itemBuilder: (context, index) {
                final serverData = movie.episodes[0].serverData[index];
                return TabBarListItem(
                  isCurrentlyPlaying: state.passingSlug == serverData.slug,
                  onTap: () => Helper.updateUrlEvent(
                    context,
                    serverData.linkM3U8,
                    serverData.name,
                    serverData.slug,
                  ),
                  sHeight: sHeight,
                  imagePath: movie.movieInfo.thumbUrl,
                  movieName: movie.movieInfo.name,
                  movieQuality: movie.movieInfo.quality,
                  episodeName: serverData.name,
                  episodeTime: movie.movieInfo.time,
                );
              },
            );
          },
        ),
        //** SIMILAR MOVIES TAB */
        BlocProvider(
          create: (context) => serviceLocator<SimilarMoviesBloc>(),
          child: SimilarMovies(categories: categories, movie: movie),
        ),
      ],
    );
  }
}
