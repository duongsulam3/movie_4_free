import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/cached_network/container_with_cached_network_image_provider.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';

class TabbarSimilarListItem extends StatelessWidget {
  const TabbarSimilarListItem({super.key, required this.movie});

  final MovieItemEntity movie;

  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.of(context).size.height;
    return Container(
      height: sHeight / (sHeight / 120),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xff575966),
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: ContainerWithCachedNetworkImageProvider(
              path: movie.thumbUrl,
              height: 120,
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(sHeight / (sHeight / 10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ResponsiveText(
                    text: movie.name,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                  ResponsiveText(
                    text: "Chất lượng: ${movie.quality}",
                    fontWeight: FontWeight.w400,
                  ),
                  ResponsiveText(
                    text: "Thời lượng: ${movie.time}",
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
