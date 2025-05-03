import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/currently_update_movies/recently_update_list_item.dart';
import 'package:smoth_movie_app/features/movies/presentation/screens/widgets/carousel_slider_item.dart';

class CustomCarouselSliderWidget extends StatelessWidget {
  const CustomCarouselSliderWidget({
    super.key,
    required this.sHeight,
    required this.items,
    required this.sWidth,
  });

  final double sHeight;
  final double sWidth;
  final List<RecentlyUpdateListItemEntity> items;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: items.length,
          itemBuilder: (context, i, pageViewIndex) {
            final item = items[i];
            return CarouselSliderItem(item: item);
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
              child: const FittedBox(
                fit: BoxFit.scaleDown,
                child: Center(
                  child: Icon(
                    CupertinoIcons.play_arrow_solid,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
