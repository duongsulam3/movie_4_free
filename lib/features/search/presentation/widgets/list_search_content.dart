import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/route_params_model/movie_detail_param_model.dart';
import 'package:smoth_movie_app/common/widgets/progress_indicator_custom.dart';
import 'package:smoth_movie_app/common/widgets/responsive_sized_box.dart';
import 'package:smoth_movie_app/core/utils/enum/movies_state_status.dart';
import 'package:smoth_movie_app/common/widgets/error_page.dart';
import 'package:smoth_movie_app/features/search/presentation/bloc/search_bloc.dart';
import 'package:smoth_movie_app/features/search/presentation/widgets/search_init_widget.dart';
import 'package:smoth_movie_app/features/search/presentation/widgets/search_item_widget.dart';
import 'package:smoth_movie_app/core/utils/helper/helper.dart';
import 'package:smoth_movie_app/router/app_router.dart';

class ListSearchContent extends StatefulWidget {
  const ListSearchContent({super.key});

  @override
  State<ListSearchContent> createState() => _ListSearchContentState();
}

class _ListSearchContentState extends State<ListSearchContent> {
  final scrollController = ScrollController();
  List<String> listTopSearch = [
    "Avatar: The Way of Water",
    "The Flash",
    "The Batman",
    "Loki Season 2",
    "Stranger Things",
    "Stranger Things Season 2",
    "Stranger Things Season 3",
    "The Witcher",
    "Jujutsu Kaisen",
    "Naruto Shippuden",
  ];
  @override
  Widget build(BuildContext context) {
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
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              topSearchList: listTopSearch,
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
