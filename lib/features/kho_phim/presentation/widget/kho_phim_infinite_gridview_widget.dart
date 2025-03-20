import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/widgets/progress_indicator.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';
import 'package:smoth_movie_app/core/bloc/kho_phim_movies_state_status.dart';
import 'package:smoth_movie_app/core/error/error_page.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/bloc/kho_phim_movies/kho_phim_movies_bloc.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/widgets/list_movie_item_widget.dart';
import 'package:smoth_movie_app/features/movies/presentation/screens/widgets/load_more_container.dart';
import 'package:smoth_movie_app/helper/helper.dart';

class InfiniteGridViewMovies extends StatelessWidget {
  const InfiniteGridViewMovies({
    super.key,
    required this.categorySlug,
    required this.countrySlug,
    required this.yearSlug,
    required this.languageSlug,
  });

  final String categorySlug;
  final String countrySlug;
  final String yearSlug;
  final String languageSlug;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<KhoPhimMoviesBloc, KhoPhimMoviesState>(
      listener: (context, state) {
        if (state.status == KhoPhimMoviesStateStatus.loading) {
          //TODO Handle Loading
          log("Loading...");
        }
      },
      bloc: context.read<KhoPhimMoviesBloc>()
        ..add(GetKhoPhimMoviesEvent(
          countrySlug: countrySlug,
          lang: languageSlug,
          categorySlug: categorySlug,
          year: yearSlug,
        )),
      builder: (context, state) {
        switch (state.status) {
          case KhoPhimMoviesStateStatus.init:
            return const Center(child: ProgressIndicatorCustom());
          case KhoPhimMoviesStateStatus.loading:
            return const Center(child: ProgressIndicatorCustom());
          case KhoPhimMoviesStateStatus.error:
            return const ErrorPage();
          default:
            if (state.isEnd && state.movies.isEmpty) {
              return const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TODO ADD AN ICON FOR EMPTY
                  ResponsiveText(text: "Tạm thời không có dữ liệu"),
                ],
              );
            } else {
              return CustomScrollView(
                shrinkWrap: true,
                primary: false,
                slivers: [
                  SliverGrid.builder(
                    addAutomaticKeepAlives: false,
                    addRepaintBoundaries: false,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      mainAxisExtent: 180,
                    ),
                    itemCount: state.movies.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListMovieItemWidget(movie: state.movies[index]);
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
                                ),
                                child: const LoadMoreContainer(),
                              ),
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
