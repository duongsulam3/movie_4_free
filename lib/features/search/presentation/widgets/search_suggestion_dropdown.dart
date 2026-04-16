import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/progress_indicator_custom.dart';
import 'package:smoth_movie_app/features/search/domain/entities/search_suggestion_entity.dart';
import 'package:smoth_movie_app/features/search/presentation/widgets/top_search_list_item.dart';

class SearchSuggestionDropdown extends StatelessWidget {
  const SearchSuggestionDropdown({
    super.key,
    required this.suggestions,
    required this.isLoading,
    required this.onSelected,
  });

  final List<SearchSuggestionEntity> suggestions;
  final bool isLoading;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Center(child: ProgressIndicatorCustom()),
      );
    }

    if (suggestions.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Center(
          child: Text(
            "Không có gợi ý phù hợp",
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      itemCount: suggestions.length,
      separatorBuilder: (_, __) => const Divider(
        height: 1,
        color: Colors.white12,
      ),
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return GestureDetector(
          onTap: () => onSelected(suggestion.name),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: TopSearchListItem(itemName: suggestion.name),
          ),
        );
      },
    );
  }
}
