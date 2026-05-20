import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/router/app_router.dart';
import '../../../../common/router/params/movie_detail_param_model.dart';
import '../../../../common/screens/error_page.dart';
import '../../../../common/utils/enum/search/search_page_status.dart';
import '../../../../common/utils/helper/helper.dart';
import '../../../../common/widgets/progress_indicator_custom.dart';
import '../../../../common/widgets/responsive_sized_box.dart';
import '../../../../common/widgets/responsive_small_text.dart';
import '../bloc/search_main_bloc/search_bloc.dart';
import 'search_init_widget.dart';
import 'search_item_widget.dart';
import 'search_suggestion_dropdown.dart';

class ListSearchContent extends StatelessWidget {
  const ListSearchContent({
    super.key,
    required this.onSelected,
    required this.onSuggestionSelected,
    required this.listSearch,
    required this.searchHistory,
    required this.onDeleteKeyword,
    required this.onClearHistory,
  });
  final ValueChanged<String> onSelected;
  final ValueChanged<String> onSuggestionSelected;
  final List<String> listSearch;
  final List<String> searchHistory;
  final ValueChanged<String> onDeleteKeyword;
  final VoidCallback onClearHistory;

  bool _shouldRebuild(SearchState previous, SearchState current) {
    return previous.movies != current.movies ||
        previous.status != current.status ||
        previous.typingQuery != current.typingQuery ||
        previous.suggestions != current.suggestions ||
        previous.isSuggestionLoading != current.isSuggestionLoading;
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<SearchBloc, SearchState>(
      buildWhen: _shouldRebuild,
      builder: (context, state) {
        switch (state.status) {
          case SearchPageStatus.init:
            return SearchInitWidget(
              onSelected: (value) => onSelected(value),
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              topSearchList: listSearch,
              introduceSource:
                  'Nguồn chính (Khuyên dùng): Được tài trở bởi KKPhim.\nDữ liệu phim miễn phí mãi mãi. Luôn được cập nhật nhanh chóng, chất lượng cao và ổn định trong thời gian dài. Tốc độ phát cực nhanh nhờ đường truyền băng thông cao, đảm bảo phục vụ lượng lớn người xem phim trực tuyến.',
              searchHistory: searchHistory,
              onDeleteKeyword: onDeleteKeyword,
              onClearHistory: onClearHistory,
            );
          case SearchPageStatus.error:
            return const ErrorPage();
          case SearchPageStatus.loading:
            return const Center(child: ProgressIndicatorCustom());
          case SearchPageStatus.suggestions:
            return SearchSuggestionDropdown(
              suggestions: state.suggestions,
              isLoading: state.isSuggestionLoading,
              onSelected: onSuggestionSelected,
            );
          default:
            return ListView.separated(
              shrinkWrap: true,
              itemCount: state.movies.length + 1,
              separatorBuilder: (_, i) => const ResponsiveSizedBox(height: 20),
              itemBuilder: (BuildContext context, int index) {
                if (index >= state.movies.length) {
                  if (state.isEnd) {
                    if (state.movies.isNotEmpty) {
                      return const SizedBox.shrink();
                    } else {
                      return ResponsiveText(
                        text: "Không có kết quả cho tìm kiếm: ${state.query}",
                        fontStyle: FontStyle.italic,
                        maxLines: 2,
                        textOverflow: TextOverflow.ellipsis,
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
                        movie: state.movies[index],
                        hasHeroEffect: true,
                        tag: "KKPhim${state.movies[index].posterUrl}",
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
            );
        }
      },
    );
  }
}
