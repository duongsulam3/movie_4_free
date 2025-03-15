import 'package:flutter/material.dart';
import 'package:smoth_movie_app/features/home/home_main/widgets/title_and_gridview_list.dart';
import 'package:smoth_movie_app/features/movies/presentation/screens/list_recently_update_movie_widget.dart';

class HomeMainContent extends StatelessWidget {
  const HomeMainContent({super.key, required this.scrollController});

  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      controller: scrollController,
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          const CarouselSliderWidget(),
          SizedBox(height: sHeight / (sHeight / 30)),
          TitleAndGridViewList(
            sHeight: sHeight,
            title: "Anime",
            path: "hoat-hinh",
          ),
          SizedBox(height: sHeight / (sHeight / 30)),
          TitleAndGridViewList(
            sHeight: sHeight,
            title: "Phim lẻ",
            path: "phim-le",
          ),
          SizedBox(height: sHeight / (sHeight / 30)),
          TitleAndGridViewList(
            sHeight: sHeight,
            title: "Phim bộ",
            path: "phim-bo",
          ),
          SizedBox(height: sHeight / (sHeight / 30)),
          TitleAndGridViewList(
            sHeight: sHeight,
            title: "Chương trình truyền hình",
            path: "tv-shows",
          ),
        ],
      ),
    );
  }
}
