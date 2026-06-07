import 'package:flutter/material.dart';

import '../../animations/fade_swipe_up_transition.dart';
import '../animated_loading/animated_loading.dart';

class SwipeLoadingButton extends StatelessWidget {
  final bool isLoading;
  final String title;
  final Color backgroundColor;
  final Color disabledBackgroundColor;
  final Color loadingIndicatorColor;

  // OPTIONAL CONTRUCTORS
  final VoidCallback? onPressed;
  final double? width;
  final double height;
  final TextStyle? titleStyle;

  const SwipeLoadingButton({
    super.key,
    required this.isLoading,
    this.title = "Title",
    this.backgroundColor = Colors.white,
    this.disabledBackgroundColor = Colors.white,
    this.loadingIndicatorColor = Colors.black,
    this.onPressed,
    this.width,
    this.height = 52,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      clipBehavior: Clip.hardEdge,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          // Responsive: width full width of the screen, height = 52 as default
          minimumSize: Size(
            width ?? double.infinity, // full width of the screen
            height,
          ),
          backgroundColor: backgroundColor,
          disabledBackgroundColor: disabledBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),

        onPressed: isLoading ? null : onPressed,
        child: AnimatedLoading(
          isLoading: isLoading,
          color: loadingIndicatorColor,
          transitionBuilder: FadeSwipeUpTransition.transitionBuilder,
          child: _ButtonTitle(
            title: title,
            titleStyle: titleStyle,
          ),
        ),
      ),
    );
  }
}

class _ButtonTitle extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;

  const _ButtonTitle({required this.title, this.titleStyle});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: titleStyle ??
          const TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
    );
  }
}
