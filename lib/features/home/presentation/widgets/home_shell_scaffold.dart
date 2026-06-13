import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/entity/page_item.dart';
import '../../../../common/entity/tab_item.dart';
import '../bloc/home_shell/home_shell_cubit.dart';
import '../bloc/home_shell/home_shell_state.dart';
import 'home_app_bar.dart';
import 'home_shell_body.dart';

class HomeShellScaffold extends StatelessWidget {
  const HomeShellScaffold({
    super.key,
    required this.pages,
    required this.tabs,
    required this.tabController,
    required this.scrollControllers,
    this.appBarHeight = 90.0,
    this.tabBarHeight = 30.0,
  });

  final List<PageItem> pages;
  final List<TabItem> tabs;
  final TabController tabController;
  final List<ScrollController> scrollControllers;
  final double appBarHeight;
  final double tabBarHeight;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeShellCubit, HomeShellState, int>(
      selector: (state) => state.currentBottomIndex,
      builder: (context, currentBottomIndex) {
        final currentPage = pages[currentBottomIndex];
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: currentPage.hasAppBar
              ? HomeAppBar(
                  scrollControllers: scrollControllers,
                  tabController: tabController,
                  tabs: tabs,
                  appBarHeight: appBarHeight,
                  tabBarHeight: tabBarHeight,
                )
              : null,
          body: HomeShellBody(
            currentBottomIndex: currentBottomIndex,
            pages: pages,
          ),
        );
      },
    );
  }
}
