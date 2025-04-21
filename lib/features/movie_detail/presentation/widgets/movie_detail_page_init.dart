import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smoth_movie_app/common/widgets/cached_network/container_with_cached_network_image_provider.dart';
import 'package:smoth_movie_app/common/widgets/lottie_asset_widget.dart';
import 'package:smoth_movie_app/common/widgets/movie_detail_page_widget.dart';
import 'package:smoth_movie_app/common/widgets/responsive_sized_box.dart';
import 'package:smoth_movie_app/core/constants/app_constants.dart';
import 'package:smoth_movie_app/core/utils/secret/app_secret.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';

class MovieDetailPageInit extends StatelessWidget {
  const MovieDetailPageInit({
    super.key,
    required this.movie,
    required this.sHeight,
    this.tag,
  });

  final MovieItemEntity movie;
  final double sHeight;
  final String? tag;

  @override
  Widget build(BuildContext context) {
    return MovieDetailPageWidget(
      child: Column(
        children: [
          tag == null
              ? ContainerWithCachedNetworkImageProvider(
                  path: movie.posterUrl.contains("http")
                      ? movie.posterUrl
                      : AppSecret.imageUrl + movie.posterUrl,
                  height: 260,
                  width: sHeight,
                )
              : Hero(
                  tag: tag!,
                  child: ContainerWithCachedNetworkImageProvider(
                    path: AppSecret.imageUrl + movie.posterUrl,
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
