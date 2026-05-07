import 'package:flutter_supper_app_core/core.dart';

import '../../../../common/widgets/progress_indicator_custom.dart';
import '../../../search/presentation/widgets/top_search_list_item.dart';
import '../../domain/entity/nguonc_search_suggestion_entity.dart';

class NguoncSearchSuggestionDropdown extends StatelessWidget {
  const NguoncSearchSuggestionDropdown({
    super.key,
    required this.suggestions,
    required this.isLoading,
    required this.onSelected,
  });

  final List<NguoncSearchSuggestionEntity> suggestions;
  final bool isLoading;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 12.v),
        child: const Center(child: ProgressIndicatorCustom()),
      );
    }

    if (suggestions.isEmpty) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 12.v),
        child: Center(
          child: Text(
            "Không có gợi ý phù hợp",
            style: TextStyle(color: Colors.white70, fontSize: 14.fSize),
          ),
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      itemCount: suggestions.length,
      separatorBuilder: (_, __) =>
          const Divider(height: 1, color: Colors.white12),
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return GestureDetector(
          onTap: () => onSelected(suggestion.name),
          child: SizedBox(
            width: double.infinity,
            height: 50.v,
            child: TopSearchListItem(itemName: suggestion.name),
          ),
        );
      },
    );
  }
}
