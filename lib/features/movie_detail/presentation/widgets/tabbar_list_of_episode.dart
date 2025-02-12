import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/movie_detail.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/blocs/detail_page_bloc/detail_page_bloc.dart';
import 'package:smoth_movie_app/features/movies/presentation/screens/widgets/carousel_slider_item.dart';

class TabBarListOfEpisode extends StatelessWidget {
  const TabBarListOfEpisode({
    super.key,
    required this.movie,
    required this.episodeIndex,
  });

  final MovieDetailEntity movie;
  final int episodeIndex;

  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.of(context).size.height;
    final sWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        context.read<DetailPageBloc>().add(
              SetNewVideoPlayer(
                newUrl: movie.episodes[0].serverData[episodeIndex].linkM3U8,
                newEpisode: movie.episodes[0].serverData[episodeIndex].name,
              ),
            );
      },
      child: Container(
        height: sHeight / (sHeight / 120),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xff575966),
            ),
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              height: sHeight / (sHeight / 120),
              width: sWidth / (sWidth / 200),
              child: CachedNetworkImageWidget(url: movie.movieInfo.thumbUrl),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(sHeight / (sHeight / 10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ResponsiveText(
                      text: movie.movieInfo.name,
                      fontSize: 16,
                      textOverflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    ResponsiveText(
                      text: "Chất lượng: ${movie.movieInfo.quality}",
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    ResponsiveText(
                      text: movie.episodes[0].serverData[episodeIndex].name,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    ResponsiveText(
                      text: "Thời lượng: ${movie.movieInfo.time}",
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
