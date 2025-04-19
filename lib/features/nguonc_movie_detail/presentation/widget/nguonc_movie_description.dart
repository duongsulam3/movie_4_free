import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/widgets/icon_and_text_widget.dart';
import 'package:smoth_movie_app/features/nguonc_movie_detail/domain/entity/nguonc_movie_entity.dart';
import 'package:smoth_movie_app/features/nguonc_movie_detail/presentation/widget/nguonc_episode_bloc_builder_name.dart';

class NguoncMovieDescription extends StatelessWidget {
  const NguoncMovieDescription({
    super.key,
    required this.movie,
    required this.sHeight,
    required this.sWidth,
  });

  final NguoncMovieEntity movie;
  final double sHeight;
  final double sWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(sHeight / (sHeight / 10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              ResponsiveText(
                text: movie.name,
                fontSize: 24,
                textColor: Colors.white,
                fontWeight: FontWeight.bold,
                maxLines: 3,
              ),
              ResponsiveText(
                text: movie.originalName,
                fontSize: 16,
                maxLines: 3,
              ),
              NguoncEpisodeBlocBuilderName(movie: movie),
              ReadMoreText(
                movie.description,
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
                text: movie.totalEpisodes == 1
                    ? "Phim Điện Ảnh"
                    : movie.currentEpisode.contains("Hoàn")
                        ? movie.currentEpisode
                        : "${movie.currentEpisode}/${movie.totalEpisodes}",
                fontSize: 12,
                icon: CupertinoIcons.square_stack_3d_up,
              ),
              IconAndTextWidget(
                screenWidth: sWidth,
                text: movie.categories[1].list[0].name,
                icon: CupertinoIcons.tags,
                fontSize: 12,
              ),
              IconAndTextWidget(
                screenWidth: sWidth,
                text: movie.casts,
                icon: CupertinoIcons.person_3_fill,
                fontSize: 12,
              ),
              IconAndTextWidget(
                screenWidth: sWidth,
                text: movie.director,
                icon: CupertinoIcons.person_crop_rectangle,
                fontSize: 12,
              ),
              IconAndTextWidget(
                screenWidth: sWidth,
                text: movie.categories[3].list[0].name,
                icon: CupertinoIcons.globe,
                fontSize: 12,
              ),
            ],
          ),
        )
      ],
    );
  }
}
