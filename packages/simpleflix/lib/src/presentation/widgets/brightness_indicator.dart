import 'package:flutter/material.dart';
import '../../controller/controller.dart';

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

      //
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
            children: [
              const Icon(
                Icons.brightness_4_rounded,
                color: Colors.white,
                size: 20,
              ),
              const SizedBox(width: 8),
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
}
