import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smoth_movie_app/core/constants/app_constants.dart';
import 'package:smoth_movie_app/common/widgets/responsive_asset_image.dart';
import 'package:smoth_movie_app/features/home/presentation/widgets/text_field_change_hint_widget.dart';

class LogoAndWidget extends StatelessWidget {
  const LogoAndWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.of(context).size.height;
    final sWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(top: sHeight / (sHeight / 10)),
      child: Row(
        spacing: sWidth / (sWidth / 10),
        children: [
          const Expanded(
            flex: 1,
            child: ResponsiveAssetImage(path: AppConstants.appLogo),
          ),
          const TextFieldChangeHint(),
        ],
      ),
    );
  }
}
