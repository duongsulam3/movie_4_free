import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/core/utils/helper/helper.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/category.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/movie_detail.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/widgets/tabbar_list_item.dart';
import 'package:smoth_movie_app/features/movies/presentation/screens/similar_movies.dart';
import 'package:smoth_movie_app/features/movies/presentation/bloc/similar_movies/similar_movies_bloc.dart';
import 'package:smoth_movie_app/init_dependencies.dart';

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
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: movie.episodes[0].serverData.length,
          itemBuilder: (context, index) => TabBarListItem(
            onTap: () => Helper.updateUrlEvent(
              context,
              movie.episodes[0].serverData[index].linkM3U8,
              movie.episodes[0].serverData[index].name,
            ),
            sHeight: sHeight,
            imagePath: movie.movieInfo.thumbUrl,
            movieName: movie.movieInfo.name,
            movieQuality: movie.movieInfo.quality,
            episodeName: movie.episodes[0].serverData[index].name,
            episodeTime: movie.movieInfo.time,
          ),
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
