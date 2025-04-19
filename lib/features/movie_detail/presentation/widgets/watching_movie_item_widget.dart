import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/list_movie_item_widget.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';

class WatchingMovieItem extends StatelessWidget {
  const WatchingMovieItem({super.key, required this.movie});

  final MovieItemEntity movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListMovieItemWidget(
          movie: movie,
          onTap: () {},
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.black.withValues(alpha: 0.7),
          ),
          child: const Center(
            child: ResponsiveText(
              text: "Đang xem",
              textColor: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}