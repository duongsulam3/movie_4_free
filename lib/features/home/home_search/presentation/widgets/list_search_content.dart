import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/model/movie_detail_param_model.dart';
import 'package:smoth_movie_app/common/widgets/responsive_sized_box.dart';
import 'package:smoth_movie_app/core/bloc/movies_state_status.dart';
import 'package:smoth_movie_app/core/error/error_page.dart';
import 'package:smoth_movie_app/features/home/home_search/presentation/bloc/search_bloc.dart';
import 'package:smoth_movie_app/features/home/home_search/presentation/widgets/no_more_movies_for_search.dart';
import 'package:smoth_movie_app/features/home/home_search/presentation/widgets/search_init_widget.dart';
import 'package:smoth_movie_app/features/home/home_search/presentation/widgets/search_item_widget.dart';
import 'package:smoth_movie_app/features/movies/presentation/screens/widgets/load_more_container.dart';
import 'package:smoth_movie_app/helper/helper.dart';
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
    "Đấu phá thương khung",
    "The Flash",
    "The Batman",
  ];
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<SearchBloc, SearchState>(
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
                  return state.isEnd
                      ? const NoMoreMoviesForSearchWidget()
                      : GestureDetector(
                          onTap: () =>
                              Helper.loadMoreSearch(context, state.query),
                          child: const LoadMoreContainer(),
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
              separatorBuilder: (BuildContext context, int index) {
                return const ResponsiveSizedBox(height: 20);
              },
            );
        }
      },
    );
  }
}
