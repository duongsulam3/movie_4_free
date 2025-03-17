import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/widgets/progress_indicator.dart';
import 'package:smoth_movie_app/core/bloc/movies_state_status.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/widgets/list_movie_item_widget.dart';
import 'package:smoth_movie_app/features/movies/presentation/bloc/movies_bloc/movies_bloc.dart';

class GridViewMoviesWidget extends StatefulWidget {
  const GridViewMoviesWidget({super.key, required this.path});
  final String path;

  @override
  State<GridViewMoviesWidget> createState() => _GridViewMoviesWidgetState();
}

class _GridViewMoviesWidgetState extends State<GridViewMoviesWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<MoviesBloc, MoviesState>(
      bloc: context.read<MoviesBloc>()
        ..add(GetListMovies(path: widget.path, limit: 9, isRefresh: false)),
      builder: (context, state) {
        switch (state.status) {
          case MoviesStateStatus.init:
            return const Center(child: ProgressIndicatorCustom());
          case MoviesStateStatus.error:
            return const Center(child: Text('Có lỗi khi tải phim'));
          case MoviesStateStatus.success:
            final items = state.movies;
            return GridView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                mainAxisExtent: 180,
              ),
              itemCount: items.length,
              itemBuilder: (_, i) => ListMovieItemWidget(movie: items[i]),
            );
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
