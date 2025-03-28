import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smoth_movie_app/common/widgets/dotlottie_asset_widget.dart';
import 'package:smoth_movie_app/common/widgets/responsive_sized_box.dart';
import 'package:smoth_movie_app/core/constants/app_constants.dart';

class ProgressIndicatorCustom extends StatelessWidget {
  const ProgressIndicatorCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveSizedBox(
      height: 50,
      width: 50,
      child: DotlottieAssetWidget(
        assetString: AppConstants.rippleLoading,
        isLoop: true,
        renderCache: RenderCache.raster,
      ),
    );
  }
}
