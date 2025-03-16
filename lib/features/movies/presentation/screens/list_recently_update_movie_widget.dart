import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/widgets/progress_indicator.dart';
import 'package:smoth_movie_app/common/widgets/responsive_sized_box.dart';
import 'package:smoth_movie_app/core/bloc/movies_state_status.dart';
import 'package:smoth_movie_app/core/error/error_page.dart';
import 'package:smoth_movie_app/features/movies/presentation/bloc/recently_update_movies/recently_update_movies_bloc.dart';
import 'package:smoth_movie_app/features/movies/presentation/screens/widgets/custom_carousel_slider.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.of(context).size.height;
    final sWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<RecentlyUpdateMoviesBloc, RecentlyUpdateMoviesState>(
      bloc: context.read<RecentlyUpdateMoviesBloc>()
        ..add(GetRecentlyUpdateMovies()),
      builder: (context, state) {
        switch (state.status) {
          case MoviesStateStatus.init:
            return const ResponsiveSizedBox(
              height: 400,
              child: Center(child: ProgressIndicatorCustom()),
            );
          case MoviesStateStatus.error:
            return const ErrorPage();
          case MoviesStateStatus.success:
            return CustomCarouselSliderWidget(
              sHeight: sHeight,
              items: state.movies,
              sWidth: sWidth,
            );
        }
      },
    );
  }
}
