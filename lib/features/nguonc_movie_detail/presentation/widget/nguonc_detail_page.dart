import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/screens/error_page.dart';
import 'package:smoth_movie_app/common/widgets/progress_indicator_custom.dart';
import 'package:smoth_movie_app/core/utils/enum/detail_movie/detail_movie_status.dart';
import 'package:smoth_movie_app/features/nguonc_movie_detail/presentation/bloc/nguonc_movie_detail_bloc.dart';

class NguoncDetailPage extends StatelessWidget {
  const NguoncDetailPage({super.key, required this.slug});

  final String slug;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<NguoncMovieDetailBloc>();
    return BlocBuilder<NguoncMovieDetailBloc, NguoncMovieDetailState>(
      bloc: bloc..add(GetNguoncMovieDetailEvent(slug: slug)),
      builder: (context, state) {
        switch (state.status) {
          case DetailMovieStatus.init:
            return const SizedBox.shrink();
          case DetailMovieStatus.loading:
            return const ProgressIndicatorCustom();
          case DetailMovieStatus.error:
            return const ErrorPage();
          default:
            return SafeArea(
              child: Scaffold(
                body: Text(state.movie!.categories[0].list[0].name),
              ),
            );
        }
      },
    );
  }
}
