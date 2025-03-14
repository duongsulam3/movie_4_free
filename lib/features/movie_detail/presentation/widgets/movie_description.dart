import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/movie_detail.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/widgets/icon_and_text_widget.dart';

class MovieDescription extends StatelessWidget {
  final MovieDetailEntity movie;
  final String passingEpisode;
  const MovieDescription({
    super.key,
    required this.movie,
    this.passingEpisode = "",
  });

  @override
  Widget build(BuildContext context) {
    // Convert string to list
    final listCate = movie.movieInfo.categories.map((e) => e.name).toList();
    //** Get current episode */
    String currentEpisode = movie.episodes[0].serverData[0].name;
    if (passingEpisode != "" && passingEpisode != currentEpisode) {
      currentEpisode = passingEpisode;
    }

    final sWidth = MediaQuery.of(context).size.width;
    final sHeight = MediaQuery.of(context).size.height;
    //
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(sHeight / (sHeight / 10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          movie.movieInfo.episodeTotal == "1"
              ? ResponsiveText(
                  text:
                      "${movie.movieInfo.name} - ${movie.movieInfo.originName}",
                  fontSize: 16,
                )
              : ResponsiveText(
                  text:
                      "${movie.movieInfo.name} - ${movie.movieInfo.originName}\n$currentEpisode",
                  fontSize: 20,
                  textColor: Colors.white,
                  maxLines: 10,
                ),
          SizedBox(height: sHeight / (sHeight / 10)),
          ReadMoreText(
            movie.movieInfo.content,
            trimLines: 5,
            trimExpandedText: " Rút gọn",
            trimCollapsedText: "Đọc thêm",
            style: TextStyle(
              fontSize: sWidth / (sWidth / 14),
              color: Colors.grey,
              height: 1.5,
            ),
          ),
          SizedBox(height: sHeight / (sHeight / 10)),
          movie.movieInfo.episodeTotal == "1"
              ? IconAndTextWidget(
                  screenWidth: sWidth,
                  text: '1/1',
                  icon: CupertinoIcons.square_stack_3d_down_right,
                )
              : movie.movieInfo.episodeCurrent.contains("Hoàn Tất")
                  ? IconAndTextWidget(
                      screenWidth: sWidth,
                      text: movie.movieInfo.episodeCurrent,
                      fontSize: 14,
                      icon: CupertinoIcons.square_stack_3d_down_right,
                    )
                  : IconAndTextWidget(
                      screenWidth: sWidth,
                      text:
                          "${movie.movieInfo.episodeCurrent}/${movie.movieInfo.episodeTotal}",
                      fontSize: 14,
                      icon: CupertinoIcons.square_stack_3d_down_right,
                    ),
          SizedBox(height: sHeight / (sHeight / 10)),
          IconAndTextWidget(
            screenWidth: sWidth,
            text: listCate.join(", "),
            icon: CupertinoIcons.tags,
            fontSize: 12,
          ),
          SizedBox(height: sHeight / (sHeight / 10)),
          // Text("Diễn viên: $listActor"),
          IconAndTextWidget(
            screenWidth: sWidth,
            text: movie.movieInfo.actor.join(", "),
            icon: CupertinoIcons.rectangle_stack_person_crop,
            fontSize: 12,
          ),
          SizedBox(height: sHeight / (sHeight / 10)),
          // Text("Đạo diễn: ${movie.movieInfo.director}"),
          IconAndTextWidget(
            screenWidth: sWidth,
            text: movie.movieInfo.director.join(", "),
            icon: CupertinoIcons.person_crop_rectangle,
            fontSize: 12,
          ),
          SizedBox(height: sHeight / (sHeight / 10)),
          IconAndTextWidget(
            screenWidth: sWidth,
            text: movie.movieInfo.countries[0].name,
            icon: CupertinoIcons.globe,
            fontSize: 12,
          ),
        ],
      ),
    );
  }
}
