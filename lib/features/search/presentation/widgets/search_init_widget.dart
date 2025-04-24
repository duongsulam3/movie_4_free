import 'package:flutter/cupertino.dart';
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
  });

  final double screenHeight;
  final double screenWidth;
  final List<String> topSearchList;
  final ValueChanged<String> onSelected;
  final String introduceSource;

  @override
  Widget build(BuildContext context) {
    return topSearchList.isEmpty
        ? ResponsiveText(
            text: introduceSource,
            fontSize: 12,
            fontStyle: FontStyle.italic,
            maxLines: 8,
          )
        : SingleChildScrollView(
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ResponsiveText(
                  text: introduceSource,
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                  maxLines: 8,
                ),
                const ResponsiveText(
                  text: "Phim có lượt tìm kiếm cao",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: topSearchList.length,
                  separatorBuilder: (_, i) =>
                      const ResponsiveSizedBox(height: 10),
                  itemBuilder: (context, i) {
                    return GestureDetector(
                      onTap: () => onSelected(topSearchList[i]),
                      child: TopSearchListItem(itemName: topSearchList[i]),
                    );
                  },
                ),
              ],
            ),
          );
  }
}
