import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_supper_app_core/core.dart';

import '../../../../common/screens/error_page.dart';
import '../../../../common/utils/enum/movies_sortby_time/movies_sortby_time_status.dart';
import '../../../../common/widgets/responsive_sized_box.dart';
import '../bloc/movies_sortby_time/movies_sort_by_time_bloc.dart';
import 'widgets/sort_by_time_carousel_slider.dart';

class BlocBuilderMoviesSortByTime extends StatelessWidget {
  const BlocBuilderMoviesSortByTime({super.key});

  static const double _carouselHeight = 400;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesSortByTimeBloc, MoviesSortByTimeState>(
      builder: (context, state) {
        return AnimatedStateSwitcher(
          switchKey: state.status,
          child: _buildContent(state),
        );
      },
    );
  }

  Widget _buildContent(MoviesSortByTimeState state) {
    return switch (state.status) {
      MoviesSortByTimeStateStatus.init => const SizedBox(),
      MoviesSortByTimeStateStatus.error => const ErrorPage(),
      MoviesSortByTimeStateStatus.loading =>
        const _CarouselLoadingPlaceholder(),

      // default
      _ => SortByTimeCarouselSlider(
          items: state.movies,
        ),
    };
  }
}

class _CarouselLoadingPlaceholder extends StatelessWidget {
  const _CarouselLoadingPlaceholder();

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizedBox(
      height: BlocBuilderMoviesSortByTime._carouselHeight.v,
      child: const DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0xFF2A2A2A),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }
}
