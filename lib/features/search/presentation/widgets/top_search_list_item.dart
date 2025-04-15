import 'package:flutter/cupertino.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';

class TopSearchListItem extends StatelessWidget {
  const TopSearchListItem({super.key, required this.itemName});

  final String itemName;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        const Icon(CupertinoIcons.bolt_horizontal_circle, size: 16),
        Expanded(child: ResponsiveText(text: itemName, fontSize: 16)),
      ],
    );
  }
}