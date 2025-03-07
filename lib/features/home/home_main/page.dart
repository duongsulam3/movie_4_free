import 'package:flutter/material.dart';
import 'package:smoth_movie_app/features/home/home_main/widgets/title_and_gridview_list.dart';
import 'package:smoth_movie_app/features/movies/presentation/screens/list_recently_update_movie_widget.dart';

class HomeMain extends StatelessWidget {
  final ScrollController? scrollController;
  const HomeMain({super.key, this.scrollController});

  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.of(context).size.height;
    // final sWidth = MediaQuery.of(context).size.width;
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
