import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/screens/error_page.dart';
import 'package:smoth_movie_app/common/widgets/list_movie_item_widget.dart';
import 'package:smoth_movie_app/common/widgets/movie_item_skeleton_loading.dart';
import 'package:smoth_movie_app/common/core/router/app_router.dart';
import 'package:smoth_movie_app/common/core/router/params/movie_detail_param_model.dart';
import 'package:smoth_movie_app/common/core/utils/helper/helper.dart';
import 'package:smoth_movie_app/common/core/utils/secret/app_secret.dart';

import '../../../../common/core/utils/enum/kho_phim/kho_phim_movies_state_status.dart';
import '../../../movies/presentation/screens/widgets/load_more_container.dart';
import '../../../movies/presentation/screens/widgets/movies_gridview_builder.dart';
import '../../../movies/presentation/screens/widgets/movies_silver_gridview_builder.dart';
import '../bloc/kho_phim_movies/kho_phim_movies_bloc.dart';
import 'kho_phim_no_more_movies_widget.dart';

class InfiniteGridViewMovies extends StatefulWidget {
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
  State<InfiniteGridViewMovies> createState() => _InfiniteGridViewMoviesState();
}

class _InfiniteGridViewMoviesState extends State<InfiniteGridViewMovies> {
  @override
  void initState() {
    super.initState();
    _loadMovies();
  }

  @override
  void didUpdateWidget(covariant InfiniteGridViewMovies oldWidget) {
    super.didUpdateWidget(oldWidget);
    final filtersChanged = oldWidget.countrySlug != widget.countrySlug ||
        oldWidget.languageSlug != widget.languageSlug ||
        oldWidget.categorySlug != widget.categorySlug ||
        oldWidget.yearSlug != widget.yearSlug ||
        oldWidget.limit != widget.limit;
    if (filtersChanged) {
      _loadMovies();
    }
  }

  void _loadMovies() {
    // Trigger fetch only on first mount or when filters change.
    context.read<KhoPhimMoviesBloc>().add(GetKhoPhimMoviesEvent(
          countrySlug: widget.countrySlug,
          lang: widget.languageSlug,
          categorySlug: widget.categorySlug,
          year: widget.yearSlug,
          limit: widget.limit,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KhoPhimMoviesBloc, KhoPhimMoviesState>(
      builder: (context, state) {
        switch (state.status) {
          case KhoPhimMoviesStateStatus.init:
            return const SizedBox.shrink();
          case KhoPhimMoviesStateStatus.error:
            return const ErrorPage();
          case KhoPhimMoviesStateStatus.loading:
            return MoviesGridBuilder(
              itemCount: widget.limit,
              itemBuilder: (_, i) => const MovieItemSkeletonLoading(),
            );
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
                    delegate: SliverChildListDelegate([
                      state.isEnd
                          ? const SizedBox()
                          : GestureDetector(
                              onTap: () => Helper.loadKhoPhimMovies(
                                context,
                                widget.countrySlug,
                                widget.languageSlug,
                                widget.categorySlug,
                                widget.yearSlug,
                                widget.limit,
                              ),
                              child: const LoadMoreContainer(),
                            )
                    ]),
                  ),
                ],
              );
            }
        }
      },
    );
  }
}
