import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_supper_app_core/core.dart';

import '../../../domain/entities/movies_page/movie_item.dart';
import 'sort_by_time_carousel_slider_item.dart';

class SortByTimeCarouselSlider extends StatelessWidget {
  const SortByTimeCarouselSlider({super.key, required this.items});

  final List<MovieItemEntity> items;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: items.length,
          options: CarouselOptions(
            height: 400.v,
            viewportFraction: 1,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 10),
            autoPlayAnimationDuration: const Duration(seconds: 3),
            autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
          ),
          itemBuilder: (context, i, pageViewIndex) {
            return SortByTimeCarouselSliderItem(item: items[i]);
          },
        ),
        Positioned(
          bottom: 10.v,
          right: 10.h,
          child: IgnorePointer(
            child: Container(
              height: 50.v,
              width: 50.h,
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
