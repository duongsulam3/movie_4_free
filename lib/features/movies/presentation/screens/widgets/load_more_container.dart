import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';

class LoadMoreContainer extends StatelessWidget {
  const LoadMoreContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 30,
      decoration: BoxDecoration(
        color: const Color(0xff252525),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ResponsiveText(
            text: "Xem thêm",
            textColor: Colors.white,
          ),
          FittedBox(child: Icon(Icons.arrow_drop_down))
        ],
      ),
    );
  }
}