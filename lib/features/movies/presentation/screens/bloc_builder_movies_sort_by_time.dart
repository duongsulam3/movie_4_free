import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/screens/error_page.dart';
import 'package:smoth_movie_app/common/widgets/progress_indicator_custom.dart';
import 'package:smoth_movie_app/common/widgets/responsive_sized_box.dart';
import 'package:smoth_movie_app/core/utils/enum/movies_sortby_time/movies_sortby_time_status.dart';
import 'package:smoth_movie_app/features/movies/presentation/bloc/movies_sortby_time/movies_sort_by_time_bloc.dart';
import 'package:smoth_movie_app/features/movies/presentation/screens/widgets/sort_by_time_carousel_slider.dart';

class BlocBuilderMoviesSortByTime extends StatelessWidget {
  const BlocBuilderMoviesSortByTime({super.key});

  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.of(context).size.height;
    final sWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<MoviesSortByTimeBloc, MoviesSortByTimeState>(
      builder: (context, state) {
        switch (state.status) {
          case MoviesSortByTimeStateStatus.init:
            return const SizedBox();
          case MoviesSortByTimeStateStatus.error:
            return const ErrorPage();
          case MoviesSortByTimeStateStatus.loading:
            return const ResponsiveSizedBox(
              height: 400,
              child: Center(child: ProgressIndicatorCustom()),
            );
          default:
            return SortByTimeCarouselSlider(
              sHeight: sHeight,
              items: state.movies,
              sWidth: sWidth,
            );
        }
      },
    );
  }
}
