import 'package:flutter/cupertino.dart';

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

  IconData get icon {
    switch (this) {
      case HomeBottomNav.home:
        return CupertinoIcons.house;
      case HomeBottomNav.khoPhim:
        return CupertinoIcons.arrowtriangle_right_square;
      case HomeBottomNav.donate:
        return CupertinoIcons.hand_thumbsup;
    }
  }

  IconData get activeIcon {
    switch (this) {
      case HomeBottomNav.home:
        return CupertinoIcons.house_fill;
      case HomeBottomNav.khoPhim:
        return CupertinoIcons.arrowtriangle_right_square_fill;
      case HomeBottomNav.donate:
        return CupertinoIcons.hand_thumbsup_fill;
    }
  }
}
