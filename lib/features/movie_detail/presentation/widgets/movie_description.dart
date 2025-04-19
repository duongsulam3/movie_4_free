import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/movie_detail.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/bloc/detail_movie/detail_movie_bloc.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/widgets/icon_and_text_widget.dart';

class MovieDescription extends StatelessWidget {
  const MovieDescription({super.key, required this.movie});

  final MovieDetailEntity movie;

  @override
  Widget build(BuildContext context) {
    //** ADD CATEGORIES NAME TO LIST */
    final listCate = movie.movieInfo.categories.map((e) => e.name).toList();

    final sWidth = MediaQuery.of(context).size.width;
    final sHeight = MediaQuery.of(context).size.height;
    //
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(sHeight / (sHeight / 10)),
      child: Column(
        spacing: 10,
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
          BlocBuilder<DetailMovieBloc, DetailMovieState>(
            buildWhen: (previous, current) {
              return previous.passingEpisode != current.passingEpisode;
            },
            builder: (context, state) {
              return ResponsiveText(
                text: movie.movieInfo.episodeTotal == "1"
                    ? "Phim lẻ"
                    : state.passingEpisode,
                fontSize: 16,
              );
            },
          ),
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
          IconAndTextWidget(
            screenWidth: sWidth,
            text: listCate.join(", "),
            icon: CupertinoIcons.tags,
            fontSize: 12,
          ),
          IconAndTextWidget(
            screenWidth: sWidth,
            text: movie.movieInfo.actor.join(", "),
            icon: CupertinoIcons.person_3_fill,
            fontSize: 12,
          ),
          IconAndTextWidget(
            screenWidth: sWidth,
            text: movie.movieInfo.director.join(", "),
            icon: CupertinoIcons.person_crop_rectangle,
            fontSize: 12,
          ),
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
