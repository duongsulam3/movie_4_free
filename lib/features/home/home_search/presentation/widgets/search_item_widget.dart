import 'package:flutter/cupertino.dart';
import 'package:smoth_movie_app/common/model/movie_detail_param_model.dart';
import 'package:smoth_movie_app/common/widgets/cached_network/container_with_cached_network_image_provider.dart';
import 'package:smoth_movie_app/common/widgets/responsive_sized_box.dart';
import 'package:smoth_movie_app/core/secret/app_secret.dart';
import 'package:smoth_movie_app/features/home/home_search/presentation/widgets/search_item_content.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';
import 'package:smoth_movie_app/router/app_router.dart';

class SearchItemWidget extends StatelessWidget {
  const SearchItemWidget({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.movie,
  });

  final double screenWidth;
  final double screenHeight;

  final MovieItemEntity movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        AppRouter.movieDetail,
        arguments: MovieDetailParamModel(slug: movie.slug),
      ),
      child: SizedBox(
        height: screenHeight / (screenHeight / 180),
        width: screenWidth,
        child: Row(
          children: [
            //** Image */
            ContainerWithCachedNetworkImageProvider(
              path: AppSecret.imageUrl + movie.posterUrl,
              width: 120,
            ),
            const ResponsiveSizedBox(width: 10),
            //** Content */
            Expanded(
              child: SearchItemContent(
                screenHeight: screenHeight,
                movie: movie,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
