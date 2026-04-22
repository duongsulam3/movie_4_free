import 'package:cupertino_native/style/sf_symbol.dart';
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

  CNSymbol get icon {
    switch (this) {
      case HomeBottomNav.home:
        return const CNSymbol(
          "house",
          color: Colors.black,
        );
      case HomeBottomNav.khoPhim:
        return const CNSymbol(
          "arrowtriangle.right.square",
          color: Colors.black,
        );
      case HomeBottomNav.donate:
        return const CNSymbol(
          "hand.thumbsup",
          color: Colors.black,
        );
    }
  }

  CNSymbol get activeIcon {
    switch (this) {
      case HomeBottomNav.home:
        return const CNSymbol(
          "house.fill",
          color: Colors.white,
        );
      case HomeBottomNav.khoPhim:
        return const CNSymbol(
          "arrowtriangle.right.square.fill",
          color: Colors.white,
        );
      case HomeBottomNav.donate:
        return const CNSymbol(
          "hand.thumbsup.fill",
          color: Colors.white,
        );
    }
  }
}
