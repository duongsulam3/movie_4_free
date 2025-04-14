import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/widgets/responsive_sized_box.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/movie_detail.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/bloc/detail_movie/detail_movie_bloc.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/widgets/detail_page_tabbar.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/widgets/icon_back_button.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/widgets/movie_description.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/widgets/movie_player_widget.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/widgets/tabbar_view_content.dart';

class MovieDetailTabBar extends StatelessWidget {
  const MovieDetailTabBar({super.key, required this.movie});

  final MovieDetailEntity movie;

  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.of(context).size.height;
    final sWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<DetailMovieBloc, DetailMovieState>(
      buildWhen: (previous, current) {
        return previous.passingUrl != current.passingUrl;
      },
      builder: (context, state) {
        return DefaultTabController(
          length: 2,
          animationDuration: const Duration(milliseconds: 500),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: ResponsiveSizedBox(
                  height: 260,
                  child: MoviePlayerWidget(
                    m3u8Url: movie.episodes[0].serverData[0].linkM3U8,
                    posterUrl: movie.movieInfo.posterUrl,
                    newVideoUrl: state.passingUrl,
                  ),
                ),
              ),
              Positioned(
                top: sHeight / (sHeight / 12),
                left: sWidth / (sWidth / 10),
                child: const ResponsiveSizedBox(
                  height: 20,
                  width: 20,
                  child: FittedBox(child: IconBackButton()),
                ),
              ),
              Positioned(
                top: sHeight / (sHeight / 260),
                left: 0,
                right: 0,
                bottom: 0,
                child: NestedScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  headerSliverBuilder: (context, value) {
                    return [
                      SliverToBoxAdapter(
                        child: MovieDescription(
                          movie: movie,
                          passingEpisode: state.passingEpisode,
                        ),
                      ),
                      const SliverToBoxAdapter(child: DetailPageTabBar()),
                    ];
                  },
                  body: ExpandedTabBarViewContent(
                    movie: movie,
                    categories: movie.movieInfo.categories,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
