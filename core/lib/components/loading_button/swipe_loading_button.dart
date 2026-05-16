import 'package:flutter/material.dart';

import 'animation/swipe_up_animation.dart';

class SwipeLoadingButton extends StatelessWidget {
  final bool isLoading;
  final String title;
  final Color backgroundColor;
  final Color disabledBackgroundColor;

  // OPTIONAL CONTRUCTORS
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final TextStyle? titleStyle;

  const SwipeLoadingButton({
    super.key,
    required this.isLoading,
    this.title = "Title",
    this.backgroundColor = Colors.white,
    this.disabledBackgroundColor = Colors.white,
    this.onPressed,
    this.width,
    this.height,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        // Responsive: width = 85% screen width, height = 52 if not provided
        minimumSize: Size(
          width ?? screenWidth * 0.85,
          height ?? 52,
        ),
        backgroundColor: backgroundColor,
        disabledBackgroundColor: disabledBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),

      // Vô hiệu hóa click khi đang trong trạng thái loading nhằm ngăn chặn Double-Submit
      onPressed: isLoading ? null : onPressed,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        switchInCurve: Curves.easeOutCubic,
        switchOutCurve: Curves.easeInCubic,

        // Custom kiến trúc dịch chuyển trục Y
        transitionBuilder: SwipeUpAnimation.transitionBuilder,

        // BẮT BUỘC: Phải có ValueKey khác nhau để AnimatedSwitcher nhận biết và kích hoạt Animation
        child: isLoading

            // Loading Widget
            ? const _LoadingIndicator()

            // Title Widget
            : _ButtonTitle(
                title: title,
                titleStyle: titleStyle,
              ),
      ),
    );
  }
}

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      key: ValueKey('button_loading_indicator'),
      width: 24,
      height: 24,
      child: CircularProgressIndicator(
        strokeWidth: 2.5,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
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
      key: const ValueKey('button_title_text'),
      style: titleStyle ??
          const TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
    );
  }
}
