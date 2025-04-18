import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/widgets/responsive_sized_box.dart';
import 'package:smoth_movie_app/common/widgets/webview_video_player_widget.dart';
import 'package:smoth_movie_app/features/nguonc_movie_detail/domain/entity/nguonc_movie_entity.dart';
import 'package:smoth_movie_app/features/nguonc_movie_detail/presentation/bloc/nguonc_movie_detail_bloc.dart';

class NguoncPlayerBlocBuilder extends StatelessWidget {
  const NguoncPlayerBlocBuilder({super.key, required this.movie});

  final NguoncMovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizedBox(
      height: 260,
      width: double.infinity,
      child: BlocBuilder<NguoncMovieDetailBloc, NguoncMovieDetailState>(
        buildWhen: (previous, current) {
          return previous.passingUrl != current.passingUrl;
        },
        builder: (context, state) {
          return WebviewVideoPlayerWidget(
            url: movie.episodes[0].items[0].embed,
            thumbUrl: movie.thumbUrl,
            newVideoUrl: state.passingUrl,
          );
        },
      ),
    );
  }
}
