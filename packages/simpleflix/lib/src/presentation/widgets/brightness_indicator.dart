import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../controller/controller.dart';
import '../../ui/components/adaptive_icon.dart';

class BrightnessIndicator extends StatelessWidget {
  const BrightnessIndicator({super.key, required this.controller});

  final SimpleFlixController controller;

  @override
  Widget build(BuildContext context) {
    // Responsive Design cho Brightness Indicator with sizeOfMediaQuery
    final sizeOfMediaQuery = MediaQuery.sizeOf(context);
    final width = sizeOfMediaQuery.width;
    final height = sizeOfMediaQuery.height;

    return ValueListenableBuilder<bool>(
      valueListenable: controller.isBrightnessIndicatorVisible,
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
            horizontal: width * 0.02, // Responsive 2% chiều rộng
            vertical: height * 0.03, // Responsive 3% chiều cao
          ), // Responsive padding
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.7),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: width * 0.02, // spacing giữa icon và progress
            children: [
              ValueListenableBuilder<double>(
                valueListenable: controller.brightness,
                builder: (context, brightness, _) {
                  final icons = getBrightnessIcons(brightness);
                  return AdaptiveIcon(
                    androidIcon: icons.$1,
                    iosIcon: icons.$2,
                    color: Colors.white,
                    size: 24.0,
                  );
                },
              ),

              // Thanh progress thể hiện mức độ sáng hiện tại
              ValueListenableBuilder<double>(
                valueListenable: controller.brightness,
                builder: (context, brightness, _) {
                  return SizedBox(
                    width: width * 0.2, // Chiếm 20% chiều rộng
                    height: height * 0.008, // Chiếm 0.8% chiều cao
                    child: LinearProgressIndicator(
                      value: brightness,
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

  // Hàm để lấy icon tương ứng với mức độ sáng
  (IconData, IconData) getBrightnessIcons(double brightness) {
    switch (brightness) {
      case 0:
        return (Icons.brightness_low_rounded, CupertinoIcons.sun_min_fill);
      case < 0.5:
        return (Icons.brightness_medium_rounded, CupertinoIcons.sun_min_fill);
      default:
        return (Icons.brightness_high_rounded, CupertinoIcons.sun_max_fill);
    }
  }
}
