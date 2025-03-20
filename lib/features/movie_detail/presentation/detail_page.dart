import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/widgets/progress_indicator.dart';
import 'package:smoth_movie_app/core/error/error_page.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/blocs/detail_movie_bloc/detail_movie_bloc.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/blocs/detail_page_bloc/detail_page_bloc.dart';
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
        if (state is GetMovieDetailStateSuccess) {
          final movie = state.movieDetail;
          final episodes = movie.episodes[0].serverData;
          String initEpisode = episodes[0].linkM3U8;
          return BlocProvider(
            create: (context) => DetailPageBloc(),
            child: MovieDetailContent(
              initEpisode: initEpisode,
              movie: movie,
              episodes: episodes,
            ),
          );
        } else if (state is MovieLoadingState) {
          return const Scaffold(body: Center(child: ProgressIndicatorCustom()));
        } else {
          return const ErrorPage();
        }
      },
    );
  }
}
