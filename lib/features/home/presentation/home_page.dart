import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_supper_app_core/core.dart';

import '../../../common/entity/page_item.dart';
import '../../../common/entity/tab_item.dart';
import '../enum/home_category.dart';
import '../enum/home_shell_page.dart';
import 'bloc/home_shell/home_shell_cubit.dart';
import 'widgets/home_bottom_nav_overlay.dart';
import 'widgets/home_shell_page_content.dart';
import 'widgets/home_shell_scaffold.dart';
import 'widgets/home_top_tab_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  static final int _tabCount = HomeCategoryTab.values.length;

  late final TabController tabController;
  late final List<ScrollController> scrollControllers;
  late final List<TabItem> tabs;
  late final List<PageItem> pages;
  int _lastHandledTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _initializeHomeView();
  }

  void _initializeHomeView() {
    _initializeControllers();
    _initializeTopTabs();
    _initializeShellPages();
  }

  void _initializeTopTabs() {
    tabs = List.generate(HomeCategoryTab.values.length, (i) {
      final category = HomeCategoryTab.values[i];
      return TabItem(
        title: category.tabLabel,
        widget: HomeTopTabContent(
          index: i,
          category: category,
          scrollController: scrollControllers[i],
          tabController: tabController,
        ),
      );
    });
  }

  void _initializeShellPages() {
    pages = List.generate(
      HomeShellPage.values.length,
      (i) => PageItem(
        hasAppBar: HomeShellPage.values[i].hasAppBar,
        widget: HomeShellPageContent(
          page: HomeShellPage.values[i],
          tabs: tabs,
          tabController: tabController,
        ),
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

  void _handleTopTabChange() {
    if (tabController.index == _lastHandledTabIndex) return;
    _lastHandledTabIndex = tabController.index;
    context.read<HomeShellCubit>().markTopTabInitialized(tabController.index);
  }

  void _onChangeBottomNav(int index) {
    context.read<HomeShellCubit>().changeBottomIndex(index);
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      right: false,
      left: false,
      child: DefaultTabController(
        length: _tabCount,
        child: Stack(
          children: [
            Positioned.fill(
              child: HomeShellScaffold(
                pages: pages,
                tabs: tabs,
                tabController: tabController,
                scrollControllers: scrollControllers,
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              bottom: 20,
              child: HomeBottomNavOverlay(
                onItemSelected: _onChangeBottomNav,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
