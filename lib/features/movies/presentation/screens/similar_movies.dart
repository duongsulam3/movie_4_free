import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/screens/error_page.dart';
import 'package:smoth_movie_app/common/widgets/list_movie_item_widget.dart';
import 'package:smoth_movie_app/core/router/app_router.dart';
import 'package:smoth_movie_app/core/router/params/movie_detail_param_model.dart';
import 'package:smoth_movie_app/core/utils/enum/movies_state_status.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/category.dart';
import 'package:smoth_movie_app/features/movies/presentation/bloc/similar_movies/similar_movies_bloc.dart';

class SimilarMovies extends StatefulWidget {
  const SimilarMovies({super.key, required this.categories});

  final List<CategoryEntity> categories;

  @override
  State<SimilarMovies> createState() => _SimilarMoviesState();
}

class _SimilarMoviesState extends State<SimilarMovies>
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
            return GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                mainAxisExtent: 180,
              ),
              itemCount: state.movies.length,
              itemBuilder: (_, i) => ListMovieItemWidget(
                onTap: () => Navigator.of(context).pushReplacementNamed(
                  AppRouter.movieDetail,
                  arguments: MovieDetailParamModel(slug: state.movies[i].slug),
                ),
                movie: state.movies[i],
              ),
            );
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
