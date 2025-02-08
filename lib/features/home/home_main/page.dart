import 'package:flutter/material.dart';
import 'package:smoth_movie_app/features/movies/presentation/screens/list_movie_widget.dart';
import 'package:smoth_movie_app/features/movies/presentation/screens/list_recently_update_movie_widget.dart';

class HomeMain extends StatelessWidget {
  const HomeMain({super.key});

  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.of(context).size.height;
    // final sWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          const CarouselSliderWidget(),
          SizedBox(height: sHeight / (sHeight / 20)),
          const ListMovieWidget(title: "Hoạt hình"),
          SizedBox(height: sHeight / (sHeight / 20)),
          const ListMovieWidget(title: "Phim lẻ"),
          SizedBox(height: sHeight / (sHeight / 20)),
          const ListMovieWidget(title: "Phim bộ"),
          SizedBox(height: sHeight / (sHeight / 20)),
          const ListMovieWidget(title: "TV Shows"),
        ],
      ),
    );
  }
}
