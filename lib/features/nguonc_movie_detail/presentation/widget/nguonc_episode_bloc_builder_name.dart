import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';
import 'package:smoth_movie_app/features/nguonc_movie_detail/domain/entity/nguonc_movie_entity.dart';
import 'package:smoth_movie_app/features/nguonc_movie_detail/presentation/bloc/nguonc_movie_detail_bloc.dart';

class NguoncEpisodeBlocBuilderName extends StatelessWidget {
  const NguoncEpisodeBlocBuilderName({super.key, required this.movie});

  final NguoncMovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NguoncMovieDetailBloc, NguoncMovieDetailState>(
      buildWhen: (previous, current) {
        return previous.passingEpisode != current.passingEpisode;
      },
      builder: (context, state) {
        return ResponsiveText(
          text: movie.totalEpisodes == 1
              ? "Phim lẻ - Một tập"
              : "Tập ${state.passingEpisode}",
          fontSize: 16,
        );
      },
    );
  }
}
