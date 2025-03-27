import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DotlottieAssetWidget extends StatelessWidget {
  const DotlottieAssetWidget({
    super.key,
    required this.assetString,
    this.renderCache = RenderCache.drawingCommands,
    this.isLoop = true,
  });

  final String assetString;
  final RenderCache renderCache;
  final bool isLoop;

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      assetString,
      decoder: customDecoder,
      renderCache: renderCache,
      repeat: isLoop,
      fit: BoxFit.fill,
    );
  }
}

Future<LottieComposition?> customDecoder(List<int> bytes) {
  return LottieComposition.decodeZip(bytes, filePicker: (files) {
    return files.firstWhere(
        (f) => f.name.startsWith('animations/') && f.name.endsWith('.json'));
  });
}
