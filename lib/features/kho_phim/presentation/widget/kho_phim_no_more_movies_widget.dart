import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';

class KhoPhimNoMoreMovie extends StatelessWidget {
  const KhoPhimNoMoreMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.play_disabled_rounded,
          size: 100,
          color: Color(0xff808080),
        ),
        ResponsiveText(text: "Tạm thời không có dữ liệu"),
      ],
    );
  }
}