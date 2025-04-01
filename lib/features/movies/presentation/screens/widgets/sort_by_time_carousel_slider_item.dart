import 'package:flutter/material.dart';
import 'package:smoth_movie_app/core/router/params/movie_detail_param_model.dart';
import 'package:smoth_movie_app/common/widgets/cached_network/container_with_cached_network_image_provider.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';
import 'package:smoth_movie_app/core/router/app_router.dart';
import 'package:smoth_movie_app/core/utils/secret/app_secret.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';

class SortByTimeCarouselSliderItem extends StatelessWidget {
  const SortByTimeCarouselSliderItem({super.key, required this.item});

  final MovieItemEntity item;

  @override
  Widget build(BuildContext context) {
    // final sHeight = MediaQuery.of(context).size.height;
    final sWidth = MediaQuery.of(context).size.width;
    final String title =
        "${item.name} | ${item.countries[0].name} | ${item.episodeCurrent == "Full" ? "Phim lẻ" : item.episodeCurrent}";
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        AppRouter.movieDetail,
        arguments: MovieDetailParamModel(slug: item.slug),
      ),
      child: Stack(
        children: [
          ContainerWithCachedNetworkImageProvider(
            path: AppSecret.imageUrl + item.posterUrl,
            width: sWidth,
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 40,
              width: sWidth,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 10, top: 5),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.15),
              ),
              child: ResponsiveText(
                text: title,
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
