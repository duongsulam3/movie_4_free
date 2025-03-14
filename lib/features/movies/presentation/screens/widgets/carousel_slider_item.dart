import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/model/movie_detail_param_model.dart';
import 'package:smoth_movie_app/common/widgets/cached_network/container_with_cached_network_image_provider.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/currently_update_movies/recently_update_list_item.dart';
import 'package:smoth_movie_app/router/app_router.dart';

class CarouselSliderItem extends StatelessWidget {
  const CarouselSliderItem({super.key, required this.item});

  final RecentlyUpdateListItemEntity item;

  @override
  Widget build(BuildContext context) {
    // final sHeight = MediaQuery.of(context).size.height;
    final sWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        AppRouter.movieDetail,
        arguments: MovieDetailParamModel(slug: item.slug),
      ),
      child: Stack(
        children: [
          ContainerWithCachedNetworkImageProvider(
            path: item.posterUrl,
            width: sWidth,
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 40,
              width: sWidth,
              padding: const EdgeInsets.only(left: 5, top: 5),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.15),
              ),
              child: ResponsiveText(
                text: item.name,
                fontSize: 20,
                textColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
