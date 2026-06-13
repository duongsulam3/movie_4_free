import 'package:flutter/material.dart';

/// Fades between children whenever [switchKey] changes.
///
/// Wrap the output of a `switch` on status/case with this widget so each case
/// transition is animated automatically.
class AnimatedStateSwitcher extends StatelessWidget {
  const AnimatedStateSwitcher({
    super.key,
    required this.switchKey,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.switchInCurve = Curves.easeOut,
    this.switchOutCurve = Curves.easeIn,
  });

  final Object switchKey;
  final Widget child;
  final Duration duration;
  final Curve switchInCurve;
  final Curve switchOutCurve;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      switchInCurve: switchInCurve,
      switchOutCurve: switchOutCurve,
      transitionBuilder: (child, animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: KeyedSubtree(
        key: ValueKey<Object>(switchKey),
        child: child,
      ),
    );
  }
}
