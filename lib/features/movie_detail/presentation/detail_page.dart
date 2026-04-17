import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/screens/error_page.dart';
import 'package:smoth_movie_app/common/widgets/movie_detail_page_widget.dart';

import '../../../core/utils/enum/detail_movie/detail_movie_status.dart';
import '../../movies/domain/entities/movies_page/movie_item.dart';
import 'bloc/detail_movie/detail_movie_bloc.dart';
import 'widgets/movie_detail_page_init.dart';
import 'widgets/movie_detail_tabbar.dart';

class MovieDetailPage extends StatefulWidget {
  final MovieItemEntity movie;
  final String? tag;
  const MovieDetailPage({super.key, required this.movie, this.tag});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  late final DetailMovieBloc _detailMovieBloc;

  @override
  void initState() {
    super.initState();
    // Trigger detail fetching once to avoid repeated calls on rebuilds.
    _detailMovieBloc = context.read<DetailMovieBloc>()
      ..add(GetMovieDetailEvent(slug: widget.movie.slug));
  }

  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<DetailMovieBloc, DetailMovieState>(
      bloc: _detailMovieBloc,
      builder: (context, state) {
        switch (state.status) {
          case DetailMovieStatus.init:
            return MovieDetailPageInit(
              movie: widget.movie,
              sHeight: sHeight,
              tag: widget.tag,
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
