import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/screens/error_page.dart';
import 'package:smoth_movie_app/core/utils/enum/detail_movie/detail_movie_status.dart';
import 'package:smoth_movie_app/features/nguonc_movie_detail/presentation/bloc/nguonc_movie_detail_bloc.dart';
import 'package:smoth_movie_app/features/nguonc_movie_detail/presentation/widget/nguonc_movie_page.dart';
import 'package:smoth_movie_app/features/nguonc_movie_detail/presentation/widget/nguonc_movie_detail_page_init.dart';
import 'package:smoth_movie_app/features/nguonc_search_movies/domain/entity/nguonc_movie_item_entity.dart';

class NguoncDetailPage extends StatelessWidget {
  const NguoncDetailPage({super.key, required this.movie, required this.tag});

  final NguoncMovieItemEntity movie;
  final String tag;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<NguoncMovieDetailBloc>();
    return BlocBuilder<NguoncMovieDetailBloc, NguoncMovieDetailState>(
      bloc: bloc..add(GetNguoncMovieDetailEvent(slug: movie.slug)),
      builder: (context, state) {
        switch (state.status) {
          case DetailMovieStatus.init:
            return NguoncMovieDetailPageInit(
              movie: movie,
              tag: tag,
            );
          case DetailMovieStatus.error:
            return const ErrorPage();
          default:
            final movie = state.movie!;
            return NguoncMoviePage(movie: movie);
        }
      },
    );
  }
}
