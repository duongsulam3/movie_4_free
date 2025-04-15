import 'package:flutter/material.dart';

class ResponsiveText extends StatelessWidget {
  const ResponsiveText({
    super.key,
    required this.text,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w600,
    this.maxLines = 1,
    this.textColor = Colors.grey,
    this.fontStyle = FontStyle.normal,
    this.textOverflow,
  });

  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final int maxLines;
  final Color textColor;
  final FontStyle fontStyle;
  final TextOverflow? textOverflow;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: size.width / (size.width / fontSize),
        fontWeight: fontWeight,
        fontStyle: fontStyle,
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
