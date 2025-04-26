import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/screens/error_page.dart';
import 'package:smoth_movie_app/common/widgets/list_movie_item_widget.dart';
import 'package:smoth_movie_app/core/router/app_router.dart';
import 'package:smoth_movie_app/core/router/params/nguonc_movie_detail_params_model.dart';
import 'package:smoth_movie_app/core/utils/enum/movies_state_status.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/widgets/watching_movie_item_widget.dart';
import 'package:smoth_movie_app/features/movies/presentation/screens/widgets/movies_gridview_builder.dart';
import 'package:smoth_movie_app/features/nguonc_categories/presentation/bloc/movies_by_category_bloc.dart';

class NguoncMoviesByCate extends StatefulWidget {
  const NguoncMoviesByCate({
    super.key,
    required this.slug,
    required this.watchingMovieSlug,
  });

  final String slug;
  final String watchingMovieSlug;

  @override
  State<NguoncMoviesByCate> createState() => _NguoncMoviesByCateState();
}

class _NguoncMoviesByCateState extends State<NguoncMoviesByCate> {
  @override
  void initState() {
    context
        .read<MoviesByCategoryBloc>()
        .add(GetMoviesByCategory(slug: widget.slug));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesByCategoryBloc, MoviesByCategoryState>(
      builder: (context, state) {
        switch (state.status) {
          case MoviesStateStatus.init:
            return const SizedBox.shrink();
          case MoviesStateStatus.error:
            return const ErrorPage();
          default:
            return MoviesGridBuilder(
              itemCount: state.movies.length,
              itemBuilder: (context, index) {
                final movie = state.movies[index];
                if (widget.watchingMovieSlug == movie.slug) {
                  return WatchingMovieItem(
                    movieThumbnail: movie.thumbUrl,
                    movieName: movie.name,
                  );
                } else {
                  return ListMovieItemWidget(
                    movieUrl: movie.thumbUrl,
                    movieName: movie.name,
                    onTap: () => Navigator.of(context).pushReplacementNamed(
                      AppRouter.nguoncMovieDetail,
                      arguments: NguoncMovieDetailParamsModel(
                        movie: movie,
                        tag: "NguonC${state.movies[index].posterUrl}",
                      ),
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
