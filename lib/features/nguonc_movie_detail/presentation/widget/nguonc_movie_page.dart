import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/screens/error_page.dart';
import 'package:smoth_movie_app/features/nguonc_movie_detail/domain/entity/nguonc_movie_entity.dart';
import 'package:smoth_movie_app/features/nguonc_movie_detail/presentation/widget/nguonc_nested_scroll_content.dart';
import 'package:smoth_movie_app/features/nguonc_movie_detail/presentation/widget/nguonc_player_bloc_builder.dart';

class NguoncMoviePage extends StatelessWidget {
  const NguoncMoviePage({super.key, required this.movie});

  final NguoncMovieEntity movie;

  @override
  Widget build(BuildContext context) {
    final sWidth = MediaQuery.of(context).size.width;
    final sHeight = MediaQuery.of(context).size.height;
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
        body: movie.episodes.isEmpty
            ? const ErrorPage()
            : DefaultTabController(
                length: 2,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: NguoncPlayerBlocBuilder(movie: movie),
                    ),
                    Positioned(
                      top: 260,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: NguoncNestedScrollContent(
                        movie: movie,
                        sHeight: sHeight,
                        sWidth: sWidth,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
