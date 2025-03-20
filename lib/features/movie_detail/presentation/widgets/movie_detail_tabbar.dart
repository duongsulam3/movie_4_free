import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/movie_detail.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/server_data.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/blocs/detail_page_bloc/detail_page_bloc.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/widgets/icon_back_button.dart';
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
    final sWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<DetailPageBloc, DetailPageState>(
      buildWhen: (previous, current) => current is DetailPageStateSuccess,
      builder: (context, state) {
        return DefaultTabController(
          length: 2,
          animationDuration: const Duration(milliseconds: 500),
          child: Stack(
            children: [
              Positioned(
                top: sHeight / (sHeight / 260),
                left: 0,
                bottom: 0,
                right: 0,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      MovieDescription(
                        movie: movie,
                        passingEpisode: state.newEpisode,
                      ),
                      const TabBar(
                        dividerHeight: 0,
                        indicator: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        unselectedLabelColor: Colors.grey,
                        unselectedLabelStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        labelColor: Colors.white,
                        labelStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        tabs: [
                          Tab(text: "Tập tiếp theo"),
                          Tab(text: "Phim tương tự"),
                        ],
                      ),
                      ExpandedTabBarViewContent(
                        episodes: episodes,
                        movie: movie,
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: sHeight / (sHeight / 260),
                  child: MoviePlayerWidget(
                    m3u8Url: initEpisode,
                    posterUrl: movie.movieInfo.posterUrl,
                    newVideoUrl: state.newUrl,
                  ),
                ),
              ),
              //* Back button
              Positioned(
                top: sHeight / (sHeight / 10),
                left: sWidth / (sWidth / 10),
                child: const IconBackButton(),
              ),
            ],
          ),
        );
      },
    );
  }
}
