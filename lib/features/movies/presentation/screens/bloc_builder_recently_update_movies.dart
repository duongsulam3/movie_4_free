import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/screens/error_page.dart';
import '../../../../common/utils/enum/movies_state_status.dart';
import '../../../../common/widgets/progress_indicator_custom.dart';
import '../../../../common/widgets/responsive_sized_box.dart';
import '../bloc/recently_update_movies/recently_update_movies_bloc.dart';
import 'widgets/custom_carousel_slider.dart';

class BlocBuilderRecentlyUpdateMovies extends StatelessWidget {
  const BlocBuilderRecentlyUpdateMovies({super.key});

  bool _buildWhen(
    RecentlyUpdateMoviesState previous,
    RecentlyUpdateMoviesState current,
  ) {
    // Always rebuild when the movies change
    if (current.status == MoviesStateStatus.success ||
        current.movies != previous.movies) {
      return true;
    }

    // Only rebuild when the status changes to avoid unnecessary rebuilds
    return previous.status != current.status;
  }

  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.of(context).size.height;
    final sWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<RecentlyUpdateMoviesBloc, RecentlyUpdateMoviesState>(
      buildWhen: _buildWhen,
      builder: (context, state) {
        switch (state.status) {
          case MoviesStateStatus.init:
          case MoviesStateStatus.loading:
            return const ResponsiveSizedBox(
              height: 400,
              child: Center(child: ProgressIndicatorCustom()),
            );
          case MoviesStateStatus.error:
            return const ErrorPage();
          default:
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
