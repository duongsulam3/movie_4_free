import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/progress_indicator_custom.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';

class CategoryFeedFooter extends StatelessWidget {
  const CategoryFeedFooter({
    super.key,
    required this.isEnd,
    required this.isLoadingMore,
    required this.loadMoreFailed,
    required this.onRetry,
  });

  final bool isEnd;
  final bool isLoadingMore;
  final bool loadMoreFailed;
  final VoidCallback onRetry;

  static const double footerHeight = 48;

  @override
  Widget build(BuildContext context) {
    if (isEnd) {
      return const SizedBox.shrink();
    }

    if (loadMoreFailed) {
      return SizedBox(
        height: footerHeight,
        child: Center(
          child: TextButton(
            onPressed: onRetry,
            child: const ResponsiveText(
              text: 'Thử lại',
              textColor: Colors.white,
              fontSize: 14,
            ),
          ),
        ),
      );
    }

    if (isLoadingMore) {
      return const SizedBox(
        height: footerHeight,
        child: Center(child: ProgressIndicatorCustom()),
      );
    }

    return const SizedBox(height: footerHeight);
  }
}
