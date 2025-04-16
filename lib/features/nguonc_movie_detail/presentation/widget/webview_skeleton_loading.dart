import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/cached_network/cached_network_image.dart';
import 'package:smoth_movie_app/common/widgets/responsive_sized_box.dart';
import 'package:smoth_movie_app/features/nguonc_search_movies/domain/entity/nguonc_movie_item_entity.dart';

class WebViewPlayerSkeletonLoading extends StatelessWidget {
  const WebViewPlayerSkeletonLoading({super.key, required this.movie});

  final NguoncMovieItemEntity movie;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: Colors.white,
            shadows: [
              Shadow(
                color: Colors.black.withValues(alpha: 0.7),
                offset: const Offset(0, 2),
                blurRadius: 2,
              ),
            ],
          ),
        ),
        body: Hero(
          tag: movie.slug,
          child: Column(
            children: [
              ResponsiveSizedBox(
                height: 260,
                width: double.infinity,
                child: CachedNetworkImageWidget(url: movie.thumbUrl),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
