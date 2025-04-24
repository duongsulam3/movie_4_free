import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/screens/error_page.dart';
import 'package:smoth_movie_app/common/widgets/list_movie_item_widget.dart';
import 'package:smoth_movie_app/core/router/app_router.dart';
import 'package:smoth_movie_app/core/router/params/movie_detail_param_model.dart';
import 'package:smoth_movie_app/core/utils/enum/movies_state_status.dart';
import 'package:smoth_movie_app/core/utils/helper/helper.dart';
import 'package:smoth_movie_app/core/utils/secret/app_secret.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/category.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/movie_detail.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/widgets/watching_movie_item_widget.dart';
import 'package:smoth_movie_app/features/movies/presentation/bloc/similar_movies/similar_movies_bloc.dart';
import 'package:smoth_movie_app/features/movies/presentation/screens/widgets/movies_gridview_builder.dart';

class SimilarMovies extends StatefulWidget {
  const SimilarMovies({
    super.key,
    required this.categories,
    required this.movie,
  });

  final List<CategoryEntity> categories;
  final MovieDetailEntity movie;

  @override
  State<SimilarMovies> createState() => _SimilarMoviesState();
}

class _SimilarMoviesState extends State<SimilarMovies>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    Helper.loadSimilarMovies(context, widget.categories[0].slug);
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

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
            return MoviesGridBuilder(
              itemCount: state.movies.length,
              itemBuilder: (context, i) {
                final movie = state.movies[i];
                if (widget.movie.movieInfo.slug == movie.slug) {
                  return WatchingMovieItem(
                    movieThumbnail: AppSecret.imageUrl + movie.posterUrl,
                    movieName: movie.name,
                  );
                } else {
                  return ListMovieItemWidget(
                    movieUrl: AppSecret.imageUrl + movie.posterUrl,
                    movieName: movie.name,
                    onTap: () => Navigator.of(context).pushReplacementNamed(
                      AppRouter.movieDetail,
                      arguments: MovieDetailParamModel(movie: movie),
                    ),
                  );
                }
              },
            );
        }
      },
    );
  }
}
