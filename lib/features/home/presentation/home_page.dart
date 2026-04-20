import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/entity/nav_item.dart';
import 'package:smoth_movie_app/common/entity/page_item.dart';
import 'package:smoth_movie_app/common/entity/tab_item.dart';

import '../../../common/widgets/custom_appbar_widget.dart';
import '../../kho_phim/presentation/page.dart';
import '../../profile/page.dart';
import '../enum/category.dart';
import '../home_main/page.dart';
import '../home_main/tabs/categories_tab.dart';
import '../home_main/tabs/home_main_content.dart';
import 'bloc/home_shell/home_shell_cubit.dart';
import 'bloc/home_shell/home_shell_state.dart';
import 'widgets/home_tab_bar.dart';
import 'widgets/logo_and_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  static const appBarHeight = 90.0;
  static const tabBarHeight = 30.0;
  static const _tabCount = 5;
  //** CONTROLLERS */
  late final TabController tabController;
  late final List<ScrollController> scrollControllers;
  late final List<TabItem> tabs;
  late final List<PageItem> pages;
  late final List<NavItem> navs;
  int _lastHandledTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
    _initializeTabs();
    _initializePages();
    _initializeNavs();
  }

  void _handleTopTabChange() {
    if (tabController.index == _lastHandledTabIndex) return;
    _lastHandledTabIndex = tabController.index;
    context.read<HomeShellCubit>().markTopTabInitialized(tabController.index);
  }

  Widget _buildTopTabWidget({
    required int index,
    required HomeCategoryTab category,
  }) {
    if (category == HomeCategoryTab.home) {
      return HomeMainContent(
        scrollController: scrollControllers[index],
        tabController: tabController,
      );
    }
    return BlocBuilder<HomeShellCubit, HomeShellState>(
      buildWhen: (p, c) => p.initializedTopTabs != c.initializedTopTabs,
      builder: (context, state) {
        if (!state.isTopTabInitialized(index)) {
          return const SizedBox.shrink();
        }
        return CategoriesTab(
          scrollController: scrollControllers[index],
          path: category.slug,
        );
      },
    );
  }

  void _initializeTabs() {
    tabs = List.generate(HomeCategoryTab.values.length, (i) {
      final category = HomeCategoryTab.values[i];
      return TabItem(
        title: category.tabLabel,
        widget: _buildTopTabWidget(index: i, category: category),
      );
    });
  }

  void _initializePages() {
    pages = [
      PageItem(
        hasAppBar: true,
        widget: HomeMain(tabs: tabs, tabController: tabController),
      ),
      const PageItem(
        hasAppBar: false,
        widget: KhoPhimPage(),
      ),
      const PageItem(hasAppBar: false, widget: ProfilePage()),
    ];
  }

  void _initializeNavs() {
    navs = [
      const NavItem(
        icon: Icon(CupertinoIcons.house),
        activeIcon: Icon(CupertinoIcons.house_fill),
        title: "Trang chủ",
      ),
      const NavItem(
        icon: Icon(CupertinoIcons.arrowtriangle_right_square),
        activeIcon: Icon(CupertinoIcons.arrowtriangle_right_square_fill),
        title: "Kho phim",
      ),
      const NavItem(
        icon: Icon(CupertinoIcons.hand_thumbsup),
        activeIcon: Icon(CupertinoIcons.hand_thumbsup_fill),
        title: "Donate",
      ),
    ];
  }

  void _initializeControllers() {
    tabController = TabController(length: _tabCount, vsync: this);
    tabController.addListener(_handleTopTabChange);
    scrollControllers = List.generate(_tabCount, (index) => ScrollController());
  }

  void _disposeControllers() {
    for (final controller in scrollControllers) {
      controller.dispose();
    }
    tabController.removeListener(_handleTopTabChange);
    tabController.dispose();
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeShellCubit, HomeShellState>(
      buildWhen: (p, c) => p.currentBottomIndex != c.currentBottomIndex,
      builder: (context, state) {
        final currentPage = pages[state.currentBottomIndex];
        return SafeArea(
          bottom: false,
          right: false,
          left: false,
          child: DefaultTabController(
            length: _tabCount,
            child: Scaffold(
              extendBodyBehindAppBar: true,
              appBar: currentPage.hasAppBar == true
                  ? CustomAppbarWidget(
                      scrollControllers: scrollControllers,
                      tabController: tabController,
                      appBarHeight: appBarHeight,
                      backgroundColor: Colors.black,
                      titleWidget: const LogoAndWidget(),
                      appBarBottomWidget: PreferredSize(
                        preferredSize: const Size.fromHeight(tabBarHeight),
                        child: HomeTabBar(
                          tabs: tabs,
                          tabController: tabController,
                        ),
                      ),
                    )
                  : null,
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: state.currentBottomIndex,
                onTap: (int i) =>
                    context.read<HomeShellCubit>().changeBottomIndex(i),
                selectedFontSize: 12,
                unselectedFontSize: 12,
                iconSize: 26,
                items: List.generate(
                  navs.length,
                  (i) => BottomNavigationBarItem(
                    icon: navs[i].icon,
                    activeIcon: navs[i].activeIcon,
                    label: navs[i].title,
                  ),
                ),
              ),
              // Keeps all bottom-nav pages mounted so switching tabs does not
              // dispose/recreate their state (scroll, blocs below each page).
              body: IndexedStack(
                index: state.currentBottomIndex,
                sizing: StackFit.expand,
                children: List.generate(pages.length, (i) => pages[i].widget),
              ),
            ),
          ),
        );
      },
    );
  }
}
