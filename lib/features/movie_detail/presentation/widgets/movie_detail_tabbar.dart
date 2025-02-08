import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/movie_detail.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/server_data.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/blocs/detail_page_bloc/detail_page_bloc.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/widgets/movie_description.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/widgets/movie_player_widget.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/widgets/tabbar_view_content.dart';

class MovieDetailTabBar extends StatelessWidget {
  const MovieDetailTabBar({
    super.key,
    required this.initEpisode,
    required this.movie,
    required this.episodes,
  });

  final String initEpisode;
  final MovieDetailEntity movie;
  final List<ServerDataEntity> episodes;

  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<DetailPageBloc, DetailPageState>(
      buildWhen: (previous, current) => current is DetailPageStateSuccess,
      builder: (context, state) {
        return DefaultTabController(
          length: 2,
          animationDuration: const Duration(milliseconds: 500),
          child: Column(
            children: [
              SizedBox(
                height: sHeight / (sHeight / 260),
                child: MoviePlayerWidget(
                  m3u8Url: initEpisode,
                  posterUrl: movie.movieInfo.posterUrl,
                  newVideoUrl: state.newUrl,
                ),
              ),
              MovieDescription(
                movie: movie,
                passingEpisode: state.newEpisode,
              ),
              const TabBar(
                tabs: [
                  Tab(
                    child: Center(
                      child: ResponsiveText(
                        text: "Tập tiếp theo",
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Tab(
                    child: Center(
                      child: ResponsiveText(
                        text: "Phim tương tự",
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              ExpandedTabBarViewContent(
                episodes: episodes,
                movie: movie,
              ),
            ],
          ),
        );
      },
    );
  }
}
