import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/screens/error_page.dart';
import 'package:smoth_movie_app/common/widgets/list_movie_item_widget.dart';
import 'package:smoth_movie_app/core/utils/enum/movies_state_status.dart';
import 'package:smoth_movie_app/features/movies/presentation/screens/widgets/movies_gridview_builder.dart';
import 'package:smoth_movie_app/features/nguonc_categories/presentation/bloc/movies_by_category_bloc.dart';

class NguoncMoviesByCate extends StatefulWidget {
  const NguoncMoviesByCate({super.key, required this.slug});

  final String slug;

  @override
  State<NguoncMoviesByCate> createState() => _NguoncMoviesByCateState();
}

class _NguoncMoviesByCateState extends State<NguoncMoviesByCate> {
  @override
  void initState() {
    context
        .read<MoviesByCategoryBloc>()
        .add(GetMoviesByCategory(slug: widget.slug));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesByCategoryBloc, MoviesByCategoryState>(
      builder: (context, state) {
        switch (state.status) {
          case MoviesStateStatus.init:
            return const SizedBox.shrink();
          case MoviesStateStatus.error:
            return const ErrorPage();
          default:
            return MoviesGridBuilder(
              itemCount: state.movies.length,
              itemBuilder: (context, index) {
                final movie = state.movies[index];
                return ListMovieItemWidget(
                  onTap: () {},
                  movieUrl: movie.thumbUrl,
                  movieName: movie.name,
                );
              },
            );
        }
      },
    );
  }
}
