import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/entity/nav_item.dart';
import 'package:smoth_movie_app/common/entity/page_item.dart';
import 'package:smoth_movie_app/common/entity/tab_item.dart';

import '../../../common/widgets/custom_appbar_widget.dart';
import '../../kho_phim/presentation/page.dart';
import '../../profile/page.dart';
import '../enum/home_category.dart';
import '../enum/bottom_navigation_tab.dart';
import '../enum/home_shell_page.dart';
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
  // Layout constants.
  static const appBarHeight = 90.0;
  static const tabBarHeight = 30.0;
  static final int _tabCount = HomeCategoryTab.values.length;

  // Controllers and static view models.
  late final TabController tabController;
  late final List<ScrollController> scrollControllers;
  late final List<TabItem> tabs;
  late final List<PageItem> pages;
  late final List<NavItem> navs;

  // Prevent duplicate emits when the same top tab is re-selected.
  int _lastHandledTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _initializeHomeView();
  }

  // ----------------------------
  // Initialization
  // ----------------------------

  void _initializeHomeView() {
    _initializeControllers();
    _initializeTopTabs();
    _initializeShellPages();
    _initializeBottomNavItems();
  }

  void _initializeTopTabs() {
    tabs = List.generate(HomeCategoryTab.values.length, (i) {
      final category = HomeCategoryTab.values[i];
      return TabItem(
        title: category.tabLabel,
        widget: _buildTopTabContent(index: i, category: category),
      );
    });
  }

  void _initializeShellPages() {
    pages = List.generate(
      HomeShellPage.values.length,
      (i) => PageItem(
        hasAppBar: HomeShellPage.values[i].hasAppBar,
        widget: _buildShellPageContent(HomeShellPage.values[i]),
      ),
    );
  }

  void _initializeBottomNavItems() {
    navs = List.generate(
      HomeBottomNav.values.length,
      (i) => NavItem(
        icon: Icon(HomeBottomNav.values[i].icon),
        activeIcon: Icon(HomeBottomNav.values[i].activeIcon),
        title: HomeBottomNav.values[i].title,
      ),
    );
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

  // ----------------------------
  // Event handlers
  // ----------------------------

  void _handleTopTabChange() {
    if (tabController.index == _lastHandledTabIndex) return;
    _lastHandledTabIndex = tabController.index;
    context.read<HomeShellCubit>().markTopTabInitialized(tabController.index);
  }

  void _onChangeBottomNav(int index) {
    context.read<HomeShellCubit>().changeBottomIndex(index);
  }

  // ----------------------------
  // Builders
  // ----------------------------

  Widget _buildTopTabContent({
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

  Widget _buildShellPageContent(HomeShellPage page) {
    switch (page) {
      case HomeShellPage.home:
        return HomeMain(tabs: tabs, tabController: tabController);
      case HomeShellPage.khoPhim:
        return const KhoPhimPage();
      case HomeShellPage.profile:
        return const ProfilePage();
    }
  }

  PreferredSizeWidget? _buildAppBar(PageItem currentPage) {
    if (currentPage.hasAppBar == false) return null;
    return CustomAppbarWidget(
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
    );
  }

  Widget _buildBottomNavigationByIndex(int currentBottomIndex) {
    return BottomNavigationBar(
      currentIndex: currentBottomIndex,
      onTap: _onChangeBottomNav,
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
    );
  }

  Widget _buildBody(int currentBottomIndex) {
    // Keep pages alive to preserve scroll positions and nested bloc states.
    return IndexedStack(
      index: currentBottomIndex,
      sizing: StackFit.expand,
      children: List.generate(pages.length, (i) => pages[i].widget),
    );
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentBottomIndex = context.select<HomeShellCubit, int>(
      (cubit) => cubit.state.currentBottomIndex,
    );
    final currentPage = pages[currentBottomIndex];
    return SafeArea(
      bottom: false,
      right: false,
      left: false,
      child: DefaultTabController(
        length: _tabCount,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: _buildAppBar(currentPage),
          bottomNavigationBar:
              _buildBottomNavigationByIndex(currentBottomIndex),
          body: _buildBody(currentBottomIndex),
        ),
      ),
    );
  }
}
