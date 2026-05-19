import 'package:flutter/cupertino.dart';
import 'package:flutter_supper_app_core/core.dart';

import '../../../../common/widgets/responsive_small_text.dart';

class TopSearchListItem extends StatelessWidget {
  const TopSearchListItem({
    super.key,
    required this.itemName,
    this.icon = CupertinoIcons.flame,
  });

  final String itemName;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10.h,
      children: [
        Icon(
          icon,
          size: 14.adaptSize,
          color: CupertinoColors.systemGrey,
        ),
        Expanded(
          child: ResponsiveText(
            text: itemName,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            textColor: CupertinoColors.white,
          ),
        ),
      ],
    );
  }
}
