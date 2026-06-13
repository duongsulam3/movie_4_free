import 'package:flutter_supper_app_core/core.dart';

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
    return Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize.fSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        overflow: textOverflow,
        color: textColor,
        shadows: [
          const Shadow(
            offset: Offset(1, 1),
          ),
        ],
      ),
    );
  }
}
