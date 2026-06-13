import 'package:flutter/material.dart';

import '../../../../common/entity/tab_item.dart';
import '../../../../common/widgets/custom_appbar_widget.dart';
import 'home_tab_bar.dart';
import 'logo_and_widget.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    required this.scrollControllers,
    required this.tabController,
    required this.tabs,
    this.appBarHeight = 90.0,
    this.tabBarHeight = 30.0,
    this.backgroundColor = Colors.black,
  });

  final List<ScrollController> scrollControllers;
  final TabController tabController;
  final List<TabItem> tabs;
  final double appBarHeight;
  final double tabBarHeight;
  final Color backgroundColor;

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);

  @override
  Widget build(BuildContext context) {
    return CustomAppbarWidget(
      scrollControllers: scrollControllers,
      tabController: tabController,
      appBarHeight: appBarHeight,
      backgroundColor: backgroundColor,
      titleWidget: const LogoAndWidget(),
      appBarBottomWidget: PreferredSize(
        preferredSize: Size.fromHeight(tabBarHeight),
        child: HomeTabBar(
          tabs: tabs,
          tabController: tabController,
        ),
      ),
    );
  }
}
