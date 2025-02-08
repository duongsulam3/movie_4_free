import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/model/movie_detail_param_model.dart';
import 'package:smoth_movie_app/core/secret/app_secret.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';

class ListMovieItemWidget extends StatelessWidget {
  final MovieItemEntity movie;
  const ListMovieItemWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    // final sHeight = MediaQuery.of(context).size.height;
    final sWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        "movie_detail",
        arguments: MovieDetailParamModel(slug: movie.slug),
      ),
      child: Container(
        // height: sHeight / (sHeight / 300),
        width: sWidth / (sWidth / 150),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              AppSecret.imageUrl + movie.posterUrl,
            ),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
