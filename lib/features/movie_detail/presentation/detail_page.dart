import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/widgets/progress_indicator.dart';
import 'package:smoth_movie_app/core/bloc/detail_movie/detail_movie_status.dart';
import 'package:smoth_movie_app/core/error/error_page.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/bloc/detail_movie/detail_movie_bloc.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/widgets/movie_detail_content.dart';

class MovieDetailPage extends StatelessWidget {
  final String slug;
  const MovieDetailPage({super.key, required this.slug});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<DetailMovieBloc>();
    return BlocBuilder<DetailMovieBloc, DetailMovieState>(
      bloc: bloc..add(GetMovieDetailEvent(slug: slug)),
      builder: (context, state) {
        switch (state.status) {
          case DetailMovieStatus.init:
            return const Scaffold(
                body: Center(child: ProgressIndicatorCustom()));
          case DetailMovieStatus.loading:
            return const Scaffold(
                body: Center(child: ProgressIndicatorCustom()));
          case DetailMovieStatus.error:
            return const ErrorPage();
          default:
            return MovieDetailContent(
              initEpisode: state.movie!.episodes[0].serverData[0].linkM3U8,
              movie: state.movie!,
              episodes: state.movie!.episodes[0].serverData,
            );
        }
      },
    );
  }
}
