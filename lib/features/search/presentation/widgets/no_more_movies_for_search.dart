import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';

class NoMoreMoviesForSearchWidget extends StatelessWidget {
  const NoMoreMoviesForSearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: ResponsiveText(
        text: "Hết phim rồi!!",
        fontSize: 16,
      ),
    );
  }
}