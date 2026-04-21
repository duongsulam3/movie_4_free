enum HomeShellPage {
  home,
  khoPhim,
  profile,
}

extension HomeShellPageExtension on HomeShellPage {
  bool get hasAppBar {
    switch (this) {
      case HomeShellPage.home:
        return true;
      case HomeShellPage.khoPhim:
      case HomeShellPage.profile:
        return false;
    }
  }
}
