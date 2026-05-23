import 'package:flutter/material.dart';
import '../../controller/controller.dart';

class BrightnessIndicator extends StatelessWidget {
  const BrightnessIndicator({super.key, required this.controller});

  final SimpleFlixController controller;

  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                    width: 100,
                    height: 4,
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
