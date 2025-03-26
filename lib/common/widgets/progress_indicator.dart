import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ProgressIndicatorCustom extends StatelessWidget {
  const ProgressIndicatorCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 50,
        minWidth: 50,
        maxWidth: 100,
        maxHeight: 100,
      ),
      child: Lottie.asset(
        'assets/lottiefiles/loading.lottie',
        decoder: customDecoder,
        renderCache: RenderCache.raster,
        repeat: true,
      ),
    );
  }
}

Future<LottieComposition?> customDecoder(List<int> bytes) {
  return LottieComposition.decodeZip(bytes, filePicker: (files) {
    return files.firstWhere(
        (f) => f.name.startsWith('animations/') && f.name.endsWith('.json'));
  });
}
