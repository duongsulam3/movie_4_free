import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/screens/error_page.dart';
import 'package:smoth_movie_app/common/widgets/movie_detail_page_widget.dart';

import '../../../core/utils/enum/detail_movie/detail_movie_status.dart';
import '../../movies/domain/entities/movies_page/movie_item.dart';
import 'bloc/detail_movie/detail_movie_bloc.dart';
import 'widgets/movie_detail_page_init.dart';
import 'widgets/movie_detail_tabbar.dart';

class MovieDetailPage extends StatelessWidget {
  final MovieItemEntity movie;
  final String? tag;
  const MovieDetailPage({super.key, required this.movie, this.tag});

  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.of(context).size.height;
    final bloc = context.read<DetailMovieBloc>();
    return BlocBuilder<DetailMovieBloc, DetailMovieState>(
      bloc: bloc..add(GetMovieDetailEvent(slug: movie.slug)),
      builder: (context, state) {
        switch (state.status) {
          case DetailMovieStatus.init:
            return MovieDetailPageInit(
              movie: movie,
              sHeight: sHeight,
              tag: tag,
            );
          case DetailMovieStatus.error:
            return const ErrorPage();
          default:
            return MovieDetailPageWidget(
              child: MovieDetailTabBar(movie: state.movie!),
            );
        }
      },
    );
  }
}
