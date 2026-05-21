import 'package:flutter/material.dart';

enum HomeBottomNav {
  home,
  khoPhim,
  profile,
}

extension HomeBottomNavExtension on HomeBottomNav {
  String get title {
    switch (this) {
      case HomeBottomNav.home:
        return "Trang chủ";
      case HomeBottomNav.khoPhim:
        return "Kho phim";
      case HomeBottomNav.profile:
        return "Profile";
    }
  }

  Icon get icon {
    switch (this) {
      case HomeBottomNav.home:
        return const Icon(
          Icons.home,
          color: Colors.white,
        );
      case HomeBottomNav.khoPhim:
        return const Icon(
          Icons.widgets_rounded,
          color: Colors.white,
        );
      case HomeBottomNav.profile:
        return const Icon(
          Icons.person,
          color: Colors.white,
        );
    }
  }
}
