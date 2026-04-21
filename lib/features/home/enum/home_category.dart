enum HomeCategoryTab {
  home,
  anime,
  phimLe,
  phimBo,
  tvShows,
}

extension HomeCategoryTabExtension on HomeCategoryTab {
  String get slug {
    switch (this) {
      case HomeCategoryTab.home:
        return 'home';
      case HomeCategoryTab.anime:
        return 'hoat-hinh';
      case HomeCategoryTab.phimLe:
        return 'phim-le';
      case HomeCategoryTab.phimBo:
        return 'phim-bo';
      case HomeCategoryTab.tvShows:
        return 'tv-shows';
    }
  }

  String get tabLabel {
    switch (this) {
      case HomeCategoryTab.home:
        return 'Trang chủ';
      case HomeCategoryTab.anime:
        return 'Anime';
      case HomeCategoryTab.phimLe:
        return 'Phim lẻ';
      case HomeCategoryTab.phimBo:
        return 'Phim bộ';
      case HomeCategoryTab.tvShows:
        return 'Phim truyền hình';
    }
  }

  String? get homeGridTitle {
    switch (this) {
      case HomeCategoryTab.home:
        return null;
      case HomeCategoryTab.anime:
        return 'Anime';
      case HomeCategoryTab.phimLe:
        return 'Phim lẻ';
      case HomeCategoryTab.phimBo:
        return 'Phim bộ';
      case HomeCategoryTab.tvShows:
        return 'Chương trình truyền hình';
    }
  }
}
