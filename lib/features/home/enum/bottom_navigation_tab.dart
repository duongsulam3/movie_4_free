import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum HomeBottomNav {
  home,
  khoPhim,
  donate,
}

extension HomeBottomNavExtension on HomeBottomNav {
  String get title {
    switch (this) {
      case HomeBottomNav.home:
        return "Trang chủ";
      case HomeBottomNav.khoPhim:
        return "Kho phim";
      case HomeBottomNav.donate:
        return "Donate";
    }
  }

  Icon get icon {
    switch (this) {
      case HomeBottomNav.home:
        return const Icon(
          CupertinoIcons.house,
          color: Colors.black,
        );
      case HomeBottomNav.khoPhim:
        return const Icon(
          CupertinoIcons.arrowtriangle_right_square,
          color: Colors.black,
        );
      case HomeBottomNav.donate:
        return const Icon(
          CupertinoIcons.hand_thumbsup,
          color: Colors.black,
        );
    }
  }

  Icon get activeIcon {
    switch (this) {
      case HomeBottomNav.home:
        return const Icon(
          CupertinoIcons.house_fill,
          color: Colors.white,
        );
      case HomeBottomNav.khoPhim:
        return const Icon(
          CupertinoIcons.arrowtriangle_right_square_fill,
          color: Colors.white,
        );
      case HomeBottomNav.donate:
        return const Icon(
          CupertinoIcons.hand_thumbsup_fill,
          color: Colors.white,
        );
    }
  }
}
