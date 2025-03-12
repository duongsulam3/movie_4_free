import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/responsive_asset_image.dart';
import 'package:smoth_movie_app/common/widgets/responsive_sized_box.dart';
import 'package:smoth_movie_app/common/widgets/search_textfield_widget.dart';
import 'package:smoth_movie_app/router/app_router.dart';

class LogoAndWidget extends StatelessWidget {
  const LogoAndWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.of(context).size.height;
    final sWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(top: sHeight / (sHeight / 10)),
      child: Row(
        children: [
          const ResponsiveAssetImage(
            path: "assets/images/logo.png",
            height: 50,
            width: 50,
          ),
          ResponsiveSizedBox(width: sWidth / (sWidth / 10)),
          Expanded(
            child: SearchTextField(
              hintText: "Jujutsu Kaisen",
              isFocus: false,
              onTap: () => Navigator.of(context).pushNamed(
                AppRouter.homeSearch,
              ),
            ),
          )
        ],
      ),
    );
  }
}
