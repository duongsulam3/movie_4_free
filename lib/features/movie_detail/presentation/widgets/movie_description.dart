import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/widgets/icon_and_text_widget.dart';

class MovieDescription extends StatelessWidget {
  const MovieDescription({
    super.key,
    required this.movieName,
    required this.movieOriginalName,
    required this.episodesBlocBuilder,
    required this.movieDescription,
    required this.movieEpisodes,
    required this.categories,
    required this.actors,
    required this.directors,
    required this.countries,
  });

  final String movieName;
  final String movieOriginalName;
  final Widget episodesBlocBuilder;
  final String movieDescription;
  final String movieEpisodes;
  final String categories;
  final String actors;
  final String directors;
  final String countries;

  @override
  Widget build(BuildContext context) {
    //** ADD CATEGORIES NAME TO LIST */

    final sWidth = MediaQuery.of(context).size.width;
    final sHeight = MediaQuery.of(context).size.height;
    //
    return Container(
      padding: EdgeInsets.all(sHeight / (sHeight / 5)),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResponsiveText(
            text: movieName,
            fontSize: 24,
            textColor: Colors.white,
            fontWeight: FontWeight.bold,
            maxLines: 3,
          ),
          ResponsiveText(
            text: movieOriginalName,
            fontSize: 16,
            maxLines: 3,
          ),
          episodesBlocBuilder,
          ReadMoreText(
            movieDescription,
            trimLines: 5,
            trimExpandedText: " Rút gọn",
            trimCollapsedText: "Đọc thêm",
            style: TextStyle(
              fontSize: sWidth / (sWidth / 14),
              color: Colors.grey,
              height: 1.5,
            ),
          ),
          IconAndTextWidget(
            screenWidth: sWidth,
            text: movieEpisodes,
            icon: CupertinoIcons.square_stack_3d_up,
            fontSize: 12,
          ),
          IconAndTextWidget(
            screenWidth: sWidth,
            text: categories,
            icon: CupertinoIcons.tags,
            fontSize: 12,
          ),
          IconAndTextWidget(
            screenWidth: sWidth,
            text: actors,
            icon: CupertinoIcons.person_3_fill,
            fontSize: 12,
          ),
          IconAndTextWidget(
            screenWidth: sWidth,
            text: directors,
            icon: CupertinoIcons.person_crop_rectangle,
            fontSize: 12,
          ),
          IconAndTextWidget(
            screenWidth: sWidth,
            text: countries,
            icon: CupertinoIcons.globe,
            fontSize: 12,
          ),
        ],
      ),
    );
  }
}
