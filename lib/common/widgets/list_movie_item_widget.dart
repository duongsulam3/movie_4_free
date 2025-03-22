import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/model/movie_detail_param_model.dart';
import 'package:smoth_movie_app/common/widgets/cached_network/cached_network_image.dart';
import 'package:smoth_movie_app/core/secret/app_secret.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';
import 'package:smoth_movie_app/router/app_router.dart';

class ListMovieItemWidget extends StatelessWidget {
  final MovieItemEntity movie;
  const ListMovieItemWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    //******************************************/
    //******************************************/
    // final memoryUsage = ProcessInfo.currentRss;
    // final memoryTotal = ProcessInfo.maxRss;
    // log('Memory usage: ${memoryUsage ~/ 1024}/${memoryTotal ~/ 1024} KB');
    // final sHeight = MediaQuery.of(context).size.height;
    // final sWidth = MediaQuery.of(context).size.width;
    //******************************************/
    //******************************************/
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        AppRouter.movieDetail,
        arguments: MovieDetailParamModel(slug: movie.slug),
      ),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: CachedNetworkImageWidget(
          url: AppSecret.imageUrl + movie.posterUrl,
          memCacheHeight: 200,
          memCacheWidth: 200,
        ),
      ),
    );
  }
}
