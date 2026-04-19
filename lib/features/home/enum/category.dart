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
        return 'Phim truyện hình';
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

// enum HomeTopTab {
//   home(
//     tabLabel: 'Trang chủ',
//     slug: null,
//     homeGridTitle: null,
//   ),
//   anime(
//     tabLabel: 'Anime',
//     slug: 'hoat-hinh',
//     homeGridTitle: 'Anime',
//   ),
//   phimLe(
//     tabLabel: 'Phim lẻ',
//     slug: 'phim-le',
//     homeGridTitle: 'Phim lẻ',
//   ),
//   phimBo(
//     tabLabel: 'Phim bộ',
//     slug: 'phim-bo',
//     homeGridTitle: 'Phim bộ',
//   ),
//   tvShows(
//     tabLabel: 'Phim truyện hình',
//     slug: 'tv-shows',
//     homeGridTitle: 'Chương trình truyền hình',
//   );

//   const HomeTopTab({
//     required this.tabLabel,
//     required this.slug,
//     required this.homeGridTitle,
//   });

//   /// Label on the home top [TabBar] / [TabItem.title].
//   final String tabLabel;

//   /// API path segment for [CategoriesTab]; null for [home].
//   final String? slug;

//   /// Row title on [HomeMainContent] grid; null when this tab has no grid section.
//   final String? homeGridTitle;

//   /// Category tabs only (excludes [home]), same order as in [values].
//   static List<HomeTopTab> get categories =>
//       HomeTopTab.values.skip(1).toList(growable: false);
// }
