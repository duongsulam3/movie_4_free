import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/responsive_sized_box.dart';

import '../../../../common/entity/nav_item.dart';

class CustomAnimatedBottomBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;
  final List<NavItem> navs;

  const CustomAnimatedBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.navs,
  });

  @override
  State<CustomAnimatedBottomBar> createState() =>
      _CustomAnimatedBottomBarState();
}

class _CustomAnimatedBottomBarState extends State<CustomAnimatedBottomBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  // Trigger animation khi currentIndex thay đổi
  @override
  void didUpdateWidget(CustomAnimatedBottomBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentIndex != widget.currentIndex) {
      _controller.reset();
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizedBox(
      width: double.infinity,
      height: 60,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(999)),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.navs.length, (index) {
            final isSelected = widget.currentIndex == index;
            return Expanded(
              child: GestureDetector(
                onTap: () => widget.onTap(index),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(999)),
                    color: isSelected ? Colors.blueAccent : Colors.transparent,
                  ),
                  child: FadeTransition(
                    opacity: _animation,
                    child: isSelected
                        ? widget.navs[index].activeIcon
                        : widget.navs[index].icon,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
