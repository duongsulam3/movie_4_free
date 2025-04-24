import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';
import 'package:smoth_movie_app/core/constants/app_constants.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/movie_detail.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/bloc/detail_movie/detail_movie_bloc.dart';

class MovieDetailBlocBuilderEpisodeName extends StatelessWidget {
  const MovieDetailBlocBuilderEpisodeName({super.key, required this.movie});

  final MovieDetailEntity movie;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailMovieBloc, DetailMovieState>(
      buildWhen: (previous, current) {
        return previous.passingUrl != current.passingUrl;
      },
      builder: (context, state) => ResponsiveText(
        text: movie.movieInfo.episodeTotal == "1"
            ? AppConstants.phimLeMotTap
            : state.passingEpisode,
        fontSize: 16,
      ),
    );
  }
}
