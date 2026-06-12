import 'package:flutter/material.dart';

import '../../../l10n/localization/l10n_extension.dart';

enum HomeBottomNav {
  home,
  khoPhim,
  profile,
}

extension HomeBottomNavExtension on HomeBottomNav {
  String getTitle(BuildContext context) {
    final l = context.l10n;
    switch (this) {
      case HomeBottomNav.home:
        return l.nav_home;
      case HomeBottomNav.khoPhim:
        return l.nav_kho_phim;
      case HomeBottomNav.profile:
        return l.nav_profile;
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
