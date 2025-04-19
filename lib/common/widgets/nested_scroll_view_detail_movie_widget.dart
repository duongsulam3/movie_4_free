import 'package:flutter/material.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/widgets/detail_page_tabbar.dart';

class NestedScrollViewDetailMovieWidget extends StatelessWidget {
  const NestedScrollViewDetailMovieWidget({
    super.key,
    required this.child,
    required this.movieDescriptionWidget,
  });

  final Widget child;
  final Widget movieDescriptionWidget;

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      scrollDirection: Axis.vertical,
      physics: const AlwaysScrollableScrollPhysics(),
      headerSliverBuilder: (context, value) => [
        SliverToBoxAdapter(child: movieDescriptionWidget),
        const SliverAppBar(
          automaticallyImplyLeading: false,
          pinned: true,
          surfaceTintColor: Colors.transparent,
          title: Center(child: DetailPageTabBar()),
        ),
      ],
      body: child,
    );
  }
}
