import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';

class IconAndTextWidget extends StatelessWidget {
  const IconAndTextWidget({
    super.key,
    required this.screenWidth,
    this.fontSize = 16,
    required this.text,
    required this.icon,
  });

  final double screenWidth;
  final double fontSize;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: screenWidth / (screenWidth / 10)),
        Flexible(
          child: ResponsiveText(
            text: text,
            fontSize: fontSize,
            maxLines: 5,
          ),
        ),
      ],
    );
  }
}
