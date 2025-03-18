import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';

class CategoriesItemContainer extends StatelessWidget {
  const CategoriesItemContainer({
    super.key,
    required this.name,
    required this.backgroundColor, required this.textColor,
  });

  final String name;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: ResponsiveText(
          text: name,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          textColor: textColor,
        ),
      ),
    );
  }
}
