import 'package:flutter/material.dart';

class ResponsiveText extends StatelessWidget {
  const ResponsiveText({
    super.key,
    required this.text,
    required this.fontSize,
    this.fontWeight = FontWeight.w600,
    this.textOverflow,
    this.maxLines = 1,
    this.textColor = Colors.grey,
  });

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final TextOverflow? textOverflow;
  final int maxLines;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: size.width / (size.width / fontSize),
        fontWeight: fontWeight,
        overflow: textOverflow,
        color: textColor,
        shadows: [
          const Shadow(
            color: Colors.black,
            offset: Offset(1, 1),
          ),
        ],
      ),
    );
  }
}
