import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAssetWidget extends StatefulWidget {
  const LottieAssetWidget({
    super.key,
    required this.assetString,
    this.renderCache = RenderCache.drawingCommands,
    this.isLoop = true,
  });

  final String assetString;
  final RenderCache renderCache;
  final bool isLoop;

  @override
  State<LottieAssetWidget> createState() => _LottieAssetWidgetState();
}

class _LottieAssetWidgetState extends State<LottieAssetWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<LottieComposition?> customDecoder(List<int> bytes) {
    return LottieComposition.decodeZip(bytes, filePicker: (files) {
      return files.firstWhere(
          (f) => f.name.startsWith('animations/') && f.name.endsWith('.json'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      widget.assetString,
      controller: _controller,
      decoder: customDecoder,
      onLoaded: (composition) {
        _controller.duration = composition.duration;
        _controller.forward();
      },
      renderCache: widget.renderCache,
      repeat: widget.isLoop,
      fit: BoxFit.fill,
    );
  }
}
