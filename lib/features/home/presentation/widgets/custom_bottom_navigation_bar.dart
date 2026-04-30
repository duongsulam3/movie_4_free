import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final List<BottomNavigationBarItem> items;
  final int? currentIndex;
  final ValueChanged<int>? onItemSelected;

  const CustomBottomNavigationBar({
    super.key,
    required this.items,
    this.currentIndex,
    this.onItemSelected,
  });

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  static const double borderRadius = 30.0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight * 0.08,
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.8),
        borderRadius: const BorderRadius.all(
          Radius.circular(borderRadius),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withValues(alpha: 0.2),
            blurRadius: 6,
            offset: const Offset(0, 0.1),
          ),
        ],
      ),
      child: Row(
        children: List.generate(widget.items.length, (index) {
          final item = widget.items[index];
          final isSelected = index == widget.currentIndex;
          return Expanded(
            child: GestureDetector(
              onTap: () => widget.onItemSelected?.call(index),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.012),
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.018),
                decoration: BoxDecoration(
                  color: isSelected
                      ? Colors.white.withValues(alpha: 0.5)
                      : Colors.transparent,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(borderRadius),
                  ),
                ),
                child: item.icon,
              ),
            ),
          );
        }),
      ),
    );
  }
}
