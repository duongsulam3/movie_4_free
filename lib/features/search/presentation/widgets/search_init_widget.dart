import 'package:flutter/cupertino.dart';
import 'package:flutter_supper_app_core/core.dart';
import 'package:smoth_movie_app/common/widgets/responsive_sized_box.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';
import 'package:smoth_movie_app/features/search/presentation/widgets/top_search_list_item.dart';

class SearchInitWidget extends StatelessWidget {
  const SearchInitWidget({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.topSearchList,
    required this.onSelected,
    required this.introduceSource,
    required this.searchHistory,
    required this.onDeleteKeyword,
    required this.onClearHistory,
  });

  final double screenHeight;
  final double screenWidth;
  final List<String> topSearchList;
  final ValueChanged<String> onSelected;
  final String introduceSource;
  final List<String> searchHistory;
  final ValueChanged<String> onDeleteKeyword;
  final VoidCallback onClearHistory;

  static const int _maxDisplayHistory = 5;

  @override
  Widget build(BuildContext context) {
    final displayed = searchHistory.take(_maxDisplayHistory);
    final displayedHistory = List.generate(
      displayed.length,
      (i) => displayed.elementAt(i),
    );
    final hasHistory = displayedHistory.isNotEmpty;
    final hasTopSearch = topSearchList.isNotEmpty;

    return SingleChildScrollView(
      child: Column(
        spacing: 28.v,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResponsiveText(
            text: introduceSource,
            fontSize: 12,
            fontStyle: FontStyle.italic,
            maxLines: 8,
          ),
          if (hasHistory) _buildHistorySection(displayedHistory),
          if (hasTopSearch) _buildTopSearchSection(),
        ],
      ),
    );
  }

  Widget _buildTopSearchSection() {
    return Column(
      spacing: 10.v,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ResponsiveText(
          text: "Phim có lượt tìm kiếm cao",
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        ListView.separated(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          primary: false,
          itemCount: topSearchList.length,
          separatorBuilder: (_, __) => const ResponsiveSizedBox(height: 10),
          itemBuilder: (context, i) {
            return GestureDetector(
              onTap: () => onSelected(topSearchList[i]),
              child: TopSearchListItem(itemName: topSearchList[i]),
            );
          },
        ),
      ],
    );
  }

  Widget _buildHistorySection(List<String> displayedHistory) {
    return Column(
      spacing: 10.v,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const ResponsiveText(
              text: "Lịch sử tìm kiếm",
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            GestureDetector(
              onTap: onClearHistory,
              child: const ResponsiveText(
                text: "Xoá tất cả",
                fontSize: 12,
                textColor: CupertinoColors.systemGrey,
              ),
            ),
          ],
        ),
        ListView.separated(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          primary: false,
          itemCount: displayedHistory.length,
          separatorBuilder: (_, __) => const ResponsiveSizedBox(height: 10),
          itemBuilder: (context, i) {
            return GestureDetector(
              onTap: () => onSelected(displayedHistory[i]),
              child: Row(
                children: [
                  Expanded(
                    child: TopSearchListItem(
                      icon: CupertinoIcons.arrow_clockwise,
                      itemName: displayedHistory[i],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => onDeleteKeyword(displayedHistory[i]),
                    child: const Icon(
                      CupertinoIcons.xmark,
                      size: 14,
                      color: CupertinoColors.systemGrey,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
