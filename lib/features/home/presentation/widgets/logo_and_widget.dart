import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/responsive_asset_image.dart';
import 'package:smoth_movie_app/common/widgets/responsive_sized_box.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';

class LogoAndWidget extends StatelessWidget {
  const LogoAndWidget({super.key, required this.sHeight});

  final double sHeight;

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        ResponsiveAssetImage(
          path: "assets/images/logo.png",
          height: 50,
          width: 50,
        ),
        ResponsiveSizedBox(width: 10),
        ResponsiveText(
          text: "Movie 4 Free",
          fontSize: 24,
        ),
      ],
    );
  }
}
