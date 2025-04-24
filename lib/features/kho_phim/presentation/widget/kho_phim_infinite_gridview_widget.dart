import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/widgets/movie_item_skeleton_loading.dart';
import 'package:smoth_movie_app/core/router/app_router.dart';
import 'package:smoth_movie_app/core/router/params/movie_detail_param_model.dart';
import 'package:smoth_movie_app/core/utils/enum/kho_phim/kho_phim_movies_state_status.dart';
import 'package:smoth_movie_app/common/screens/error_page.dart';
import 'package:smoth_movie_app/core/utils/secret/app_secret.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/bloc/kho_phim_movies/kho_phim_movies_bloc.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/widget/kho_phim_no_more_movies_widget.dart';
import 'package:smoth_movie_app/common/widgets/list_movie_item_widget.dart';
import 'package:smoth_movie_app/features/movies/presentation/screens/widgets/load_more_container.dart';
import 'package:smoth_movie_app/core/utils/helper/helper.dart';
import 'package:smoth_movie_app/features/movies/presentation/screens/widgets/movies_gridview_builder.dart';
import 'package:smoth_movie_app/features/movies/presentation/screens/widgets/movies_silver_gridview_builder.dart';

class InfiniteGridViewMovies extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return BlocBuilder<KhoPhimMoviesBloc, KhoPhimMoviesState>(
      bloc: context.read<KhoPhimMoviesBloc>()
        ..add(GetKhoPhimMoviesEvent(
          countrySlug: countrySlug,
          lang: languageSlug,
          categorySlug: categorySlug,
          year: yearSlug,
          limit: limit,
        )),
      builder: (context, state) {
        switch (state.status) {
          case KhoPhimMoviesStateStatus.init:
            return const SizedBox.shrink();
          case KhoPhimMoviesStateStatus.loading:
            return MoviesGridBuilder(
              itemCount: limit,
              itemBuilder: (_, i) => const MovieItemSkeletonLoading(),
            );
          case KhoPhimMoviesStateStatus.error:
            return const ErrorPage();
          default:
            if (state.isEnd && state.movies.isEmpty) {
              return const KhoPhimNoMoreMovie();
            } else {
              return CustomScrollView(
                shrinkWrap: true,
                primary: false,
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
                    delegate: SliverChildListDelegate(
                      [
                        state.isEnd
                            ? const SizedBox()
                            : GestureDetector(
                                onTap: () => Helper.loadKhoPhimMovies(
                                  context,
                                  countrySlug,
                                  languageSlug,
                                  categorySlug,
                                  yearSlug,
                                  limit,
                                ),
                                child: const LoadMoreContainer(),
                              )
                      ],
                    ),
                  ),
                ],
              );
            }
        }
      },
    );
  }
}
