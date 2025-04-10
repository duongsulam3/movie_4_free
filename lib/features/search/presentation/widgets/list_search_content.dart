import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';
import 'package:smoth_movie_app/core/router/params/movie_detail_param_model.dart';
import 'package:smoth_movie_app/common/widgets/progress_indicator_custom.dart';
import 'package:smoth_movie_app/common/widgets/responsive_sized_box.dart';
import 'package:smoth_movie_app/common/screens/error_page.dart';
import 'package:smoth_movie_app/core/utils/enum/search/search_page_status.dart';
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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<SearchBloc, SearchState>(
      buildWhen: (previous, current) => previous.movies != current.movies,
      builder: (context, state) {
        switch (state.status) {
          case SearchPageStatus.init:
            return SearchInitWidget(
              onSelected: (value) => onSelected(value),
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              topSearchList: listSearch,
            );
          case SearchPageStatus.error:
            return const ErrorPage();
          case SearchPageStatus.loading:
            return const Center(child: ProgressIndicatorCustom());
          default:
            return ListView.separated(
              shrinkWrap: true,
              itemCount: state.movies.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index >= state.movies.length) {
                  if (state.isEnd) {
                    if (state.movies.isNotEmpty) {
                      return const SizedBox.shrink();
                    } else {
                      return ResponsiveText(
                        text: "Không có kết quả cho tìm kiếm: ${state.query}",
                      );
                    }
                  } else {
                    Helper.loadMoreSearch(context, state.query, 10);
                    return const Center(child: ProgressIndicatorCustom());
                  }
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
