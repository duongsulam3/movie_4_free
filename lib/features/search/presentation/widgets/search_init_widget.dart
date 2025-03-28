import 'package:flutter/cupertino.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';

class SearchInitWidget extends StatelessWidget {
  const SearchInitWidget({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.topSearchList,
    required this.onSelected,
  });

  final double screenHeight;
  final double screenWidth;
  final List<String> topSearchList;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ResponsiveText(
          text: "Tìm kiếm nhiều nhất",
          fontSize: 24,
        ),
        SizedBox(height: screenHeight / (screenHeight / 20)),
        ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, i) {
            return GestureDetector(
              onTap: () => onSelected(topSearchList[i]),
              child: Row(
                spacing: 10,
                children: [
                  const Icon(CupertinoIcons.bolt_horizontal_circle, size: 16),
                  ResponsiveText(text: topSearchList[i], fontSize: 16),
                ],
              ),
            );
          },
          separatorBuilder: (context, i) {
            return SizedBox(height: screenHeight / (screenHeight / 10));
          },
          itemCount: topSearchList.length,
        ),
      ],
    );
  }
}
