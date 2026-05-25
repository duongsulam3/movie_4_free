import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../controller/controller.dart';
import '../../ui/components/adaptive_icon.dart';

class VolumeIndicator extends StatelessWidget {
  const VolumeIndicator({super.key, required this.controller});

  final SimpleFlixController controller;

  @override
  Widget build(BuildContext context) {
    final sizeOfMediaQuery = MediaQuery.sizeOf(context);
    final width = sizeOfMediaQuery.width;
    final height = sizeOfMediaQuery.height;

    return ValueListenableBuilder<bool>(
      valueListenable: controller.isVolumeIndicatorVisible,
      builder: (context, isVisible, child) {
        return AnimatedOpacity(
          opacity: isVisible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 300),
          child: child,
        );
      },
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.02,
            vertical: height * 0.03,
          ),
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.7),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: width * 0.02,
            children: [
              ValueListenableBuilder<double>(
                valueListenable: controller.volume,
                builder: (context, volume, _) {
                  final icons = getVolumeIcons(volume);
                  return AdaptiveIcon(
                    androidIcon: icons.$1,
                    iosIcon: icons.$2,
                    color: Colors.white,
                    size: 20.0,
                  );
                },
              ),

              // Thanh progress thể hiện mức âm lượng hiện tại
              ValueListenableBuilder<double>(
                valueListenable: controller.volume,
                builder: (context, volume, _) {
                  return SizedBox(
                    width: width * 0.2,
                    height: height * 0.008,
                    child: LinearProgressIndicator(
                      value: volume,
                      backgroundColor: Colors.white.withValues(alpha: 0.3),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  (IconData, IconData) getVolumeIcons(double volume) {
    switch (volume) {
      case 0.0:
        return (Icons.volume_off_rounded, CupertinoIcons.speaker_slash_fill);
      case < 0.5:
        return (Icons.volume_down_rounded, CupertinoIcons.speaker_1_fill);
      default:
        return (Icons.volume_up_rounded, CupertinoIcons.speaker_3_fill);
    }
  }
}
