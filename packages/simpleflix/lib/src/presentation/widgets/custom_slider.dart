import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final double value;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 3.0, // Trackbar height
        thumbShape: const RoundSliderThumbShape(
          enabledThumbRadius: 7.0, // active Thumb radius
        ),
        overlayShape: const RoundSliderOverlayShape(
          overlayRadius: 0.0, // Hover radius when dragging
        ),
      ),
      child: Slider(
        // Clamp giá trị giữa 0.0 và 1.0 để đảm bảo không lỗi khi video chưa sẵn sàng
        value: value.clamp(0.0, 1.0),
        activeColor: Colors.white,
        inactiveColor: Colors.white24,
        onChanged: onChanged,
      ),
    );
  }
}
