import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:smoth_movie_app/common/widgets/responsive_sized_box.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';
import 'package:smoth_movie_app/common/widgets/webview_video_player_widget.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/widgets/icon_and_text_widget.dart';
import 'package:smoth_movie_app/features/nguonc_movie_detail/domain/entity/nguonc_movie_entity.dart';

class NguoncMoviePage extends StatelessWidget {
  const NguoncMoviePage({super.key, required this.movie});

  final NguoncMovieEntity movie;

  @override
  Widget build(BuildContext context) {
    final sWidth = MediaQuery.of(context).size.width;
    final sHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: Colors.white,
            shadows: [
              Shadow(
                color: Colors.black.withValues(alpha: 0.7),
                offset: const Offset(0, 2),
                blurRadius: 2,
              ),
            ],
          ),
        ),
        body: movie.episodes.isEmpty
            //TODO HANDLE LỖI KHÔNG CÓ NGUỒN
            ? const SizedBox.shrink()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    ResponsiveSizedBox(
                      height: 260,
                      width: double.infinity,
                      child: WebviewVideoPlayerWidget(
                        url: movie.episodes[0].items[0].embed,
                        thumbUrl: movie.thumbUrl,
                      ),
                    ),
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
                          ResponsiveText(
                            text: movie.totalEpisodes == 1
                                ? "Phim lẻ"
                                : movie.currentEpisode,
                            fontSize: 16,
                          ),
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
                          SizedBox(height: sHeight / (sHeight / 15)),
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
                          SizedBox(height: sHeight / (sHeight / 10)),
                          IconAndTextWidget(
                            screenWidth: sWidth,
                            text: movie.categories[1].list[0].name,
                            icon: CupertinoIcons.tags,
                            fontSize: 12,
                          ),
                          SizedBox(height: sHeight / (sHeight / 10)),
                          IconAndTextWidget(
                            screenWidth: sWidth,
                            text: movie.casts,
                            icon: CupertinoIcons.person_3_fill,
                            fontSize: 12,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
