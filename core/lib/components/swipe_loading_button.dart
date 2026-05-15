import 'package:flutter/material.dart';

class SwipeLoadingButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback? onPressed;
  final String title;

  const SwipeLoadingButton({
    super.key,
    required this.isLoading,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        // Cố định kích thước khung Button
        minimumSize: const Size(200, 52),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),

      // Vô hiệu hóa click khi đang trong trạng thái loading nhằm ngăn chặn Double-Submit
      onPressed: isLoading ? null : onPressed,

      // BẮT BUỘC: Dùng ClipRect để cắt xén phần text/indicator tràn ra ngoài biên Button khi chạy animation
      child: ClipRect(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          switchInCurve: Curves.easeOutCubic,
          switchOutCurve: Curves.easeInCubic,

          // Custom kiến trúc dịch chuyển trục Y
          transitionBuilder: (
            Widget child,
            Animation<double> animation,
          ) {
            // Xác định xem Widget này đang đi vào hay đi ra
            final isExiting = animation.status == AnimationStatus.reverse;

            final Tween<Offset> slideTween = isExiting
                ? Tween<Offset>(
                    begin: Offset(0, -1),
                    end: Offset.zero) // Đẩy lên trên khi biến mất
                : Tween<Offset>(
                    begin: Offset(0, 1),
                    end: Offset.zero); // Đi từ dưới lên khi xuất hiện

            return SlideTransition(
              position: slideTween.animate(animation),
              child: child,
            );
          },

          // BẮT BUỘC: Phải có ValueKey khác nhau để AnimatedSwitcher nhận biết và kích hoạt Animation
          child: isLoading
              ? const SizedBox(
                  key: ValueKey('button_loading_indicator'),
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : Text(
                  title,
                  key: const ValueKey('button_title_text'),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}
