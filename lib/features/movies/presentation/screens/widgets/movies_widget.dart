import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/core/error/error_page.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/widgets/list_movie_item_widget.dart';
import 'package:smoth_movie_app/features/movies/presentation/bloc/movies_bloc/movies_bloc.dart';

class MoviesList extends StatelessWidget {
  final String path;
  const MoviesList({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    //
    void loadMoreMovies() {
      final moviesBloc = context.read<MoviesBloc>();
      moviesBloc.add(GetListMovies(path: path, limit: 18));
    }

    //
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (_, state) {
        switch (state.status) {
          case MoviesStateStatus.init:
            return const Center(child: CircularProgressIndicator.adaptive());
          case MoviesStateStatus.error:
            return const ErrorPage();
          case MoviesStateStatus.success:
            if (state.movies.isEmpty) {
              return const Center(child: Text('No more movies'));
            }
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                mainAxisExtent: 180,
              ),
              itemCount:
                  state.isEnd ? state.movies.length : state.movies.length + 1,
              itemBuilder: (context, index) {
                if (index >= state.movies.length) {
                  loadMoreMovies();
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                return ListMovieItemWidget(movie: state.movies[index]);
              },
            );
        }
      },
    );
  }
}
