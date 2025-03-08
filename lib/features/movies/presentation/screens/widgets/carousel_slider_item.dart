import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/model/movie_detail_param_model.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/currently_update_movies/recently_update_list_item.dart';
import 'package:smoth_movie_app/common/widgets/cached_network_image.dart';

class CarouselSliderItem extends StatelessWidget {
  const CarouselSliderItem({
    super.key,
    required this.item,
  });

  final RecentlyUpdateListItemEntity item;

  @override
  Widget build(BuildContext context) {
    //
    // final sHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        "movie_detail",
        arguments: MovieDetailParamModel(slug: item.slug),
      ),
      child: Stack(
        children: [
          CachedNetworkImageWidget(url: item.posterUrl),
          Positioned(
            bottom: 0,
            left: 10,
            child: ResponsiveText(
              text: item.name,
              fontSize: 20,
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
