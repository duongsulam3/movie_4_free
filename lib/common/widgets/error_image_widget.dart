import 'package:flutter/cupertino.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';

class ErrorImage extends StatelessWidget {
  const ErrorImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(CupertinoIcons.wifi_exclamationmark),
        ResponsiveText(
          text: "Lỗi khi tải hình ảnh",
          fontSize: 12,
        ),
      ],
    );
  }
}
