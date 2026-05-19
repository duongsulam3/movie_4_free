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

  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.of(context).size.height;
    final sWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<RecentlyUpdateMoviesBloc, RecentlyUpdateMoviesState>(
      buildWhen: (p, c) => p.status != c.status,
      builder: (context, state) {
        switch (state.status) {
          case MoviesStateStatus.init:
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
