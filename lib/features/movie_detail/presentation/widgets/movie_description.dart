import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';
import 'package:smoth_movie_app/core/constants/app_constants.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/movie_detail.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/widgets/icon_and_text_widget.dart';

class MovieDescription extends StatelessWidget {
  final MovieDetailEntity movie;
  final String passingEpisode;
  const MovieDescription({
    super.key,
    required this.movie,
    required this.passingEpisode,
  });

  @override
  Widget build(BuildContext context) {
    //** ADD CATEGORIES NAME TO LIST */
    final listCate = movie.movieInfo.categories?.map((e) => e.name).toList();

    final sWidth = MediaQuery.of(context).size.width;
    final sHeight = MediaQuery.of(context).size.height;
    //
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(sHeight / (sHeight / 10)),
      child: Column(
        spacing: 5,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResponsiveText(
            text: movie.movieInfo.name,
            fontSize: 24,
            textColor: Colors.white,
            fontWeight: FontWeight.bold,
            maxLines: 3,
          ),
          ResponsiveText(
            text: movie.movieInfo.originName,
            fontSize: 16,
            maxLines: 3,
          ),
          ResponsiveText(
            text: movie.movieInfo.episodeTotal == "1"
                ? "Phim lẻ"
                : passingEpisode,
            fontSize: 16,
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
          IconAndTextWidget(
            screenWidth: sWidth,
            text: movie.movieInfo.episodeTotal == "1"
                ? "Phim Điện Ảnh"
                : movie.movieInfo.episodeCurrent.contains("Hoàn")
                    ? movie.movieInfo.episodeCurrent
                    : "${movie.movieInfo.episodeCurrent}/${movie.movieInfo.episodeTotal}",
            fontSize: 12,
            icon: CupertinoIcons.square_stack_3d_up,
          ),
          SizedBox(height: sHeight / (sHeight / 10)),
          IconAndTextWidget(
            screenWidth: sWidth,
            text: listCate?.join(", ") ?? AppConstants.noData,
            icon: CupertinoIcons.tags,
            fontSize: 12,
          ),
          SizedBox(height: sHeight / (sHeight / 10)),
          // Text("Diễn viên: $listActor"),
          IconAndTextWidget(
            screenWidth: sWidth,
            text: movie.movieInfo.actor.join(", "),
            icon: CupertinoIcons.person_3_fill,
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
            text: movie.movieInfo.countries?[0].name ?? AppConstants.noData,
            icon: CupertinoIcons.globe,
            fontSize: 12,
          ),
        ],
      ),
    );
  }
}
