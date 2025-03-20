import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/cached_network/container_with_cached_network_image_provider.dart';
import 'package:smoth_movie_app/common/widgets/responsive_sized_box.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';
import 'package:smoth_movie_app/core/secret/app_secret.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ContainerWithCachedNetworkImageProvider(
            path: AppSecret.qrCode,
            width: 200,
            height: 200,
          ),
          ResponsiveSizedBox(height: 20),
          ResponsiveText(
            text: 'Cảm ơn vì đã ủng hộ các nhà phát triển!',
            fontSize: 16,
            textColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}

class IconAndTextRowWidget extends StatelessWidget {
  final IconData iconData;
  final double spacing;
  final String text;
  const IconAndTextRowWidget({
    super.key,
    required this.iconData,
    required this.text,
    this.spacing = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(iconData, color: Colors.grey),
        ResponsiveSizedBox(width: spacing),
        ResponsiveText(text: text, fontSize: 20),
      ],
    );
  }
}
