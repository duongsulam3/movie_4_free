import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/currently_update_movies/recently_update_list_item.dart';
import 'package:smoth_movie_app/features/movies/presentation/screens/widgets/carousel_slider_item.dart';

class CustomCarouselSliderWidget extends StatelessWidget {
  const CustomCarouselSliderWidget({
    super.key,
    required this.sHeight,
    required this.items,
  });

  final double sHeight;
  final List<RecentlyUpdateListItemEntity> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(sHeight / (sHeight / 10)),
      child: CarouselSlider.builder(
        itemCount: items.length,
        itemBuilder: (context, i, pageViewIndex) {
          return CarouselSliderItem(items: items, itemIndex: i);
        },
        options: CarouselOptions(
          height: sHeight / (sHeight / 350),
          viewportFraction: 0.8,
          enlargeCenterPage: true,
          scrollDirection: Axis.vertical,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 10),
          autoPlayAnimationDuration: const Duration(seconds: 3),
          autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
        ),
      ),
    );
  }
}
