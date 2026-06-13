import 'package:flutter/material.dart';

import '../../../../common/entity/tab_item.dart';
import '../../../kho_phim/presentation/page.dart';
import '../../../profile/page.dart';
import '../../enum/home_shell_page.dart';
import '../../home_main/page.dart';

class HomeShellPageContent extends StatelessWidget {
  const HomeShellPageContent({
    super.key,
    required this.page,
    required this.tabs,
    required this.tabController,
  });

  final HomeShellPage page;
  final List<TabItem> tabs;
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    switch (page) {
      case HomeShellPage.home:
        return HomeMain(tabs: tabs, tabController: tabController);
      case HomeShellPage.khoPhim:
        return const KhoPhimPage();
      case HomeShellPage.profile:
        return const ProfilePage();
    }
  }
}
