import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smoth_movie_app/common/widgets/cached_network/container_with_cached_network_image_provider.dart';
import 'package:smoth_movie_app/common/widgets/lottie_asset_widget.dart';
import 'package:smoth_movie_app/common/widgets/movie_detail_page_widget.dart';
import 'package:smoth_movie_app/common/widgets/responsive_sized_box.dart';
import 'package:smoth_movie_app/core/constants/app_constants.dart';
import 'package:smoth_movie_app/features/nguonc_search_movies/domain/entity/nguonc_movie_item_entity.dart';

class NguoncMovieDetailPageInit extends StatelessWidget {
  const NguoncMovieDetailPageInit({
    super.key,
    required this.movie,
    required this.tag,
  });

  final NguoncMovieItemEntity movie;
  final String tag;

  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.of(context).size.height;
    return MovieDetailPageWidget(
      child: Column(
        children: [
          Hero(
            tag: tag,
            child: ContainerWithCachedNetworkImageProvider(
              path: movie.thumbUrl,
              height: 260,
              width: sHeight,
            ),
          ),
          const ResponsiveSizedBox(
            height: 50,
            width: 50,
            child: LottieAssetWidget(
              assetString: AppConstants.rippleLoading,
              isLoop: true,
              renderCache: RenderCache.raster,
            ),
          ),
        ],
      ),
    );
  }
}
