import 'package:flutter/material.dart';

class NavItem {
  final Icon icon;
  final Icon activeIcon;
  final String title;

  const NavItem({
    required this.icon,
    required this.activeIcon,
    required this.title,
  });
}
