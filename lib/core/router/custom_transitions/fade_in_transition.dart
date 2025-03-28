import 'package:flutter/cupertino.dart';

class FadeInTransition extends PageRouteBuilder {
  final Widget page;
  final String? routeName;
  FadeInTransition({
    required this.page,
    this.routeName,
  }) : super(
          settings: RouteSettings(name: routeName),
          transitionDuration: const Duration(milliseconds: 300),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return page;
          },
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            final tween = Tween(begin: 0.0, end: 1.0);
            return FadeTransition(
              opacity: animation.drive(tween),
              child: child,
            );
          },
        );
}
