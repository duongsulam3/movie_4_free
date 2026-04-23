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
          Icons.home,
          color: Colors.white,
        );
      case HomeBottomNav.khoPhim:
        return const Icon(
          Icons.movie,
          color: Colors.white,
        );
      case HomeBottomNav.donate:
        return const Icon(
          Icons.thumb_up,
          color: Colors.white,
        );
    }
  }

  Icon get activeIcon {
    switch (this) {
      case HomeBottomNav.home:
        return const Icon(
          Icons.home_filled,
          color: Colors.white,
        );
      case HomeBottomNav.khoPhim:
        return const Icon(
          Icons.movie_rounded,
          color: Colors.white,
        );
      case HomeBottomNav.donate:
        return const Icon(
          Icons.thumb_up_alt_rounded,
          color: Colors.white,
        );
    }
  }
}
