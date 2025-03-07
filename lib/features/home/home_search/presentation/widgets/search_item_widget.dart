import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/model/movie_detail_param_model.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';
import 'package:smoth_movie_app/core/secret/app_secret.dart';
import 'package:smoth_movie_app/features/home/home_search/domain/entities/search_movie_entity.dart';
import 'package:smoth_movie_app/features/movies/presentation/screens/widgets/cached_network_image.dart';

class SearchItemWidget extends StatelessWidget {
  const SearchItemWidget({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.movie,
  });

  final double screenWidth;
  final double screenHeight;

  final SearchMovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        "movie_detail",
        arguments: MovieDetailParamModel(slug: movie.slug),
      ),
      child: Container(
        margin: EdgeInsets.only(
          right: screenWidth / (screenWidth / 5),
        ),
        height: screenHeight / (screenHeight / 100),
        width: screenWidth,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 4,
              offset: Offset(2, 2),
            ),
            BoxShadow(
              color: Colors.grey,
              blurRadius: 4,
              offset: Offset(2, 0),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              width: screenWidth / (screenWidth / 150),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(10),
                ),
              ),
              child: CachedNetworkImageWidget(
                url: AppSecret.imageUrl + movie.posterUrl,
              ),
            ),
            SizedBox(width: screenWidth / (screenWidth / 10)),
            Flexible(
              child: ResponsiveText(
                text: movie.name,
                fontSize: 18,
                textOverflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
