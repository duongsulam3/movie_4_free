import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';

class RowTitleAndMore extends StatelessWidget {
  final String title;
  final Function()? onTap;
  const RowTitleAndMore({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ResponsiveText(
          text: title,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
        GestureDetector(
          onTap: onTap,
          child: const Icon(
            CupertinoIcons.ellipsis,
            size: 16,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
