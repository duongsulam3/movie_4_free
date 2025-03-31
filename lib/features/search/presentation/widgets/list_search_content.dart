import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/core/router/params/movie_detail_param_model.dart';
import 'package:smoth_movie_app/common/widgets/progress_indicator_custom.dart';
import 'package:smoth_movie_app/common/widgets/responsive_sized_box.dart';
import 'package:smoth_movie_app/core/utils/enum/movies_state_status.dart';
import 'package:smoth_movie_app/common/screens/error_page.dart';
import 'package:smoth_movie_app/features/search/presentation/bloc/search_bloc.dart';
import 'package:smoth_movie_app/features/search/presentation/widgets/search_init_widget.dart';
import 'package:smoth_movie_app/features/search/presentation/widgets/search_item_widget.dart';
import 'package:smoth_movie_app/core/utils/helper/helper.dart';
import 'package:smoth_movie_app/core/router/app_router.dart';

class ListSearchContent extends StatelessWidget {
  const ListSearchContent({
    super.key,
    required this.onSelected,
    required this.listSearch,
  });
  final ValueChanged<String> onSelected;
  final List<String> listSearch;

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocConsumer<SearchBloc, SearchState>(
      listenWhen: (previous, current) => previous.query != current.query,
      listener: (context, state) {
        if (scrollController.hasClients) {
          if (scrollController.offset > 0) {
            scrollController.jumpTo(0);
          }
        }
      },
      buildWhen: (previous, current) => previous.movies != current.movies,
      builder: (context, state) {
        switch (state.status) {
          case MoviesStateStatus.init:
            return SearchInitWidget(
              onSelected: (value) => onSelected(value),
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              topSearchList: listSearch,
            );
          case MoviesStateStatus.error:
            return const ErrorPage();
          case MoviesStateStatus.success:
            return ListView.separated(
              controller: scrollController,
              shrinkWrap: true,
              itemCount: state.movies.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index >= state.movies.length) {
                  if (state.isEnd) {
                    return const SizedBox.shrink();
                  }
                  Helper.loadMoreSearch(context, state.query);
                  return const Center(
                    child: ProgressIndicatorCustom(),
                  );
                } else {
                  return GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed(
                      AppRouter.movieDetail,
                      arguments: MovieDetailParamModel(
                        slug: state.movies[index].slug,
                      ),
                    ),
                    child: SearchItemWidget(
                      movie: state.movies[index],
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                    ),
                  );
                }
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const ResponsiveSizedBox(height: 20),
            );
        }
      },
    );
  }
}
