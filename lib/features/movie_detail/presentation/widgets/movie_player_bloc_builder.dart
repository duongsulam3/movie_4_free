import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/widgets/movie_player_widget.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/movie_detail.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/bloc/detail_movie/detail_movie_bloc.dart';

class BlocBuilderMoviePlayer extends StatelessWidget {
  const BlocBuilderMoviePlayer({super.key, required this.movie});

  final MovieDetailEntity movie;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailMovieBloc, DetailMovieState>(
      buildWhen: (previous, current) {
        return previous.passingUrl != current.passingUrl;
      },
      builder: (context, state) => MoviePlayerWidget(
        m3u8Url: movie.episodes[0].serverData[0].linkM3U8,
        posterUrl: movie.movieInfo.posterUrl,
        newVideoUrl: state.passingUrl,
      ),
    );
  }
}