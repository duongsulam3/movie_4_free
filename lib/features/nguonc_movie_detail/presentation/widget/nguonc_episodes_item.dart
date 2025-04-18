import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/cached_network/container_with_cached_network_image_provider.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';
import 'package:smoth_movie_app/core/utils/helper/helper.dart';
import 'package:smoth_movie_app/features/nguonc_movie_detail/domain/entity/nguonc_movie_entity.dart';

class NguoncEpisodesItem extends StatelessWidget {
  const NguoncEpisodesItem({
    super.key,
    required this.sHeight,
    required this.movie,
    required this.itemIndex,
  });

  final double sHeight;
  final NguoncMovieEntity movie;
  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Helper.nguoncUpdateUrlEvent(
        context,
        movie.episodes[0].items[itemIndex].embed,
        movie.episodes[0].items[itemIndex].name,
      ),
      child: Container(
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
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ResponsiveText(
                        text: movie.name,
                        fontSize: 16,
                        textOverflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    Expanded(
                      child: ResponsiveText(
                        text: "Chất lượng: ${movie.quality}",
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        maxLines: 1,
                      ),
                    ),
                    Expanded(
                      child: ResponsiveText(
                        text: movie.episodes[0].items[itemIndex].name == "Full"
                            ? "Phim lẻ"
                            : "Tập ${movie.episodes[0].items[itemIndex].name}",
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        maxLines: 1,
                      ),
                    ),
                    Expanded(
                      child: ResponsiveText(
                        text: "Thời lượng: ${movie.time}",
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
