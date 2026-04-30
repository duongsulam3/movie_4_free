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
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.9),
        borderRadius: const BorderRadius.all(Radius.circular(30)),
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
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: isSelected
                      ? Colors.white.withValues(alpha: 0.3)
                      : Colors.transparent,
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
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
