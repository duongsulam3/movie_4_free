import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Geometry for the sliding highlight under one bottom-nav slot.
final class _BottomNavPillLayout {
  const _BottomNavPillLayout({
    required this.left,
    required this.width,
  });

  final double left;
  final double width;

  /// Returns `null` when there are no items (caller should not show a pill).
  static _BottomNavPillLayout? maybeFrom({
    required double trackWidth,
    required int itemCount,
    required int currentIndex,
    required TextDirection textDirection,
  }) {
    if (itemCount == 0) {
      return null;
    }

    final slotWidth = trackWidth / itemCount;
    final horizontalInset = math.max(2.0, trackWidth * 0.012).clamp(2.0, 10.0);
    final pillWidth = math.max(0.0, slotWidth - 2 * horizontalInset);

    final selectedColumn = currentIndex.clamp(0, itemCount - 1);
    final pillColumn = textDirection == TextDirection.rtl
        ? itemCount - 1 - selectedColumn
        : selectedColumn;
    final left = pillColumn * slotWidth + horizontalInset;

    return _BottomNavPillLayout(left: left, width: pillWidth);
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final List<BottomNavigationBarItem> items;
  final int currentIndex;
  final ValueChanged<int> onItemSelected;

  const CustomBottomNavigationBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onItemSelected,
  });

  static const double borderRadius = 999;
  static const Duration _pillDuration = Duration(milliseconds: 250);

  @override
  Widget build(BuildContext context) {
    // Best Practice: Hạn chế dùng MediaQuery cho padding/margin cứng vì dễ vỡ layout trên iPad/Fold.
    // Tạm thời tôi giữ lại logic của bạn nhưng khuyên nên dùng SafeArea và hằng số cố định.
    final screenHeight = MediaQuery.sizeOf(context).height;
    final verticalInset = screenHeight * 0.006;

    return Container(
      height: screenHeight * 0.08,
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.8),
        borderRadius: const BorderRadius.all(Radius.circular(borderRadius)),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withValues(alpha: 0.2),
            blurRadius: 6,
            offset: const Offset(0, 0.1),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final itemCount = items.length;
          final pill = _BottomNavPillLayout.maybeFrom(
            trackWidth: constraints.maxWidth,
            itemCount: itemCount,
            currentIndex: currentIndex,
            textDirection: Directionality.of(context),
          );
          if (pill == null) {
            return const SizedBox.shrink();
          }

          return Stack(
            children: [
              AnimatedPositioned(
                duration: _pillDuration,
                curve: Curves.easeInOut,
                top: verticalInset,
                bottom: verticalInset,
                left: pill.left,
                width: pill.width,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                ),
              ),
              Row(
                children: List.generate(itemCount, (index) {
                  final item = items[index];
                  final isSelected = index == currentIndex;
                  return Expanded(
                    child: _BottomNavSlot(
                      item: item,
                      isSelected: isSelected,
                      onTap: () => onItemSelected(index),
                    ),
                  );
                }),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _BottomNavSlot extends StatelessWidget {
  final BottomNavigationBarItem item;
  final bool isSelected;
  final VoidCallback onTap;

  const _BottomNavSlot({
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // final icon = isSelected ? item.activeIcon : item.icon;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Center(child: item.icon),
    );
  }
}
