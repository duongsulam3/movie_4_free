import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/widgets/error_page.dart';
import 'package:smoth_movie_app/core/utils/enum/movies_state_status.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/category.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/movie_detail.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/widgets/tabbar_list_of_episode.dart';
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
    return TabBarView(
      children: <Widget>[
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: movie.episodes[0].serverData.length,
          itemBuilder: (context, index) {
            return TabBarListOfEpisode(
              movie: movie,
              episodeIndex: index,
            );
          },
        ),
        BlocProvider(
          create: (context) => serviceLocator<SimilarMoviesBloc>(),
          child: SimilarMoviesTabBarView(categories: categories),
        ),
      ],
    );
  }
}

class SimilarMoviesTabBarView extends StatefulWidget {
  const SimilarMoviesTabBarView({super.key, required this.categories});

  final List<CategoryEntity> categories;

  @override
  State<SimilarMoviesTabBarView> createState() =>
      _SimilarMoviesTabBarViewState();
}

class _SimilarMoviesTabBarViewState extends State<SimilarMoviesTabBarView>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    context.read<SimilarMoviesBloc>().add(FetchMovies(
          categorySlug: widget.categories[0].slug,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<SimilarMoviesBloc, SimilarMoviesState>(
      builder: (context, state) {
        switch (state.status) {
          case MoviesStateStatus.init:
            return const SizedBox.shrink();
          case MoviesStateStatus.error:
            return const ErrorPage();
          default:
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.movies.length,
              itemBuilder: (context, index) {
                return Text(state.movies[index].name);
              },
            );
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
