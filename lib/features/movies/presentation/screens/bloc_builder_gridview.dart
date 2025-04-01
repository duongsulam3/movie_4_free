import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/widgets/progress_indicator_custom.dart';
import 'package:smoth_movie_app/core/router/app_router.dart';
import 'package:smoth_movie_app/core/router/params/movie_detail_param_model.dart';
import 'package:smoth_movie_app/core/utils/enum/movies_state_status.dart';
import 'package:smoth_movie_app/common/widgets/list_movie_item_widget.dart';
import 'package:smoth_movie_app/features/movies/presentation/bloc/movies/movies_bloc.dart';
import 'package:smoth_movie_app/features/movies/presentation/screens/widgets/movies_gridview_builder.dart';

class BlocBuilderGridview extends StatefulWidget {
  const BlocBuilderGridview({super.key});

  @override
  State<BlocBuilderGridview> createState() => _BlocBuilderGridviewState();
}

class _BlocBuilderGridviewState extends State<BlocBuilderGridview>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        switch (state.status) {
          case MoviesStateStatus.init:
            return const Center(child: ProgressIndicatorCustom());
          case MoviesStateStatus.error:
            return const Center(child: Text('Có lỗi khi tải phim'));
          case MoviesStateStatus.success:
            final items = state.movies;
            return MoviesGridBuilder(
              itemCount: items.length,
              itemBuilder: (_, i) => ListMovieItemWidget(
                movie: items[i],
                onTap: () => Navigator.of(context).pushNamed(
                  AppRouter.movieDetail,
                  arguments: MovieDetailParamModel(slug: items[i].slug),
                ),
              ),
            );
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
