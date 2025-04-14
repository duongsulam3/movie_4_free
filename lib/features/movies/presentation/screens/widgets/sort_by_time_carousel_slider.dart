import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';
import 'package:smoth_movie_app/features/movies/presentation/screens/widgets/sort_by_time_carousel_slider_item.dart';

class SortByTimeCarouselSlider extends StatelessWidget {
  const SortByTimeCarouselSlider({
    super.key,
    required this.sHeight,
    required this.items,
    required this.sWidth,
  });

  final double sHeight;
  final double sWidth;
  final List<MovieItemEntity> items;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: items.length,
          itemBuilder: (context, i, pageViewIndex) {
            return SortByTimeCarouselSliderItem(item: items[i]);
          },
          options: CarouselOptions(
            height: sHeight / (sHeight / 400),
            viewportFraction: 1,
            scrollDirection: Axis.horizontal,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 10),
            autoPlayAnimationDuration: const Duration(seconds: 3),
            autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
          ),
        ),
        Positioned(
          bottom: sHeight / (sHeight / 10),
          right: sWidth / (sWidth / 10),
          child: IgnorePointer(
            ignoring: true,
            child: Container(
              height: sHeight / (sHeight / 50),
              width: sWidth / (sWidth / 50),
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(
                  CupertinoIcons.play_arrow_solid,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
