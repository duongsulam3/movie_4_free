import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/entity/nav_item.dart';
import 'package:smoth_movie_app/common/entity/page_item.dart';
import 'package:smoth_movie_app/common/entity/tab_item.dart';
import 'package:smoth_movie_app/common/widgets/custom_appbar_widget.dart';
import 'package:smoth_movie_app/core/constants/app_path.dart';
import 'package:smoth_movie_app/features/home/home_main/tabs/categories_tab.dart';
import 'package:smoth_movie_app/features/home/home_main/tabs/home_main_content.dart';
import 'package:smoth_movie_app/features/home/presentation/bloc/bottom_nav/bottom_nav_bloc.dart';
import 'package:smoth_movie_app/features/home/home_main/page.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/bloc/kho_phim/kho_phim_page_bloc.dart';
import 'package:smoth_movie_app/features/profile/page.dart';
import 'package:smoth_movie_app/features/home/presentation/widgets/home_tab_bar.dart';
import 'package:smoth_movie_app/features/home/presentation/widgets/logo_and_widget.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/bloc/categories/category_list_bloc.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/bloc/countries/countries_bloc.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/page.dart';
import 'package:smoth_movie_app/core/utils/helper/helper.dart';
import 'package:smoth_movie_app/init_dependencies.dart';

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

  //! Kho phim bloc providers
  final List<BlocProvider> khoPhimProviders = [
    BlocProvider<CountriesBloc>(
      create: (context) => serviceLocator<CountriesBloc>(),
    ),
    BlocProvider<CategoryListBloc>(
      create: (context) => serviceLocator<CategoryListBloc>(),
    ),
    BlocProvider<KhoPhimPageBloc>(
      create: (context) => KhoPhimPageBloc(
        countriesBloc: context.read<CountriesBloc>(),
        categoryListBloc: context.read<CategoryListBloc>(),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _initializeControllers();
    _initializeTabs();
    _initializePages();
    _initializeNavs();
  }

  void _initializeTabs() {
    tabs = [
      TabItem(
        title: "Trang chủ",
        widget: HomeMainContent(
          scrollController: scrollControllers[0],
          tabController: tabController,
        ),
      ),
      TabItem(
        title: "Anime",
        widget: CategoriesTab(
          scrollController: scrollControllers[1],
          path: AppPath.anime,
        ),
      ),
      TabItem(
        title: "Phim lẻ",
        widget: CategoriesTab(
          scrollController: scrollControllers[2],
          path: AppPath.phimLe,
        ),
      ),
      TabItem(
        title: "Phim bộ",
        widget: CategoriesTab(
          scrollController: scrollControllers[3],
          path: AppPath.phimBo,
        ),
      ),
      TabItem(
        title: "Phim truyện hình",
        widget: CategoriesTab(
          scrollController: scrollControllers[4],
          path: AppPath.phimTruyenHinh,
        ),
      ),
    ];
  }

  void _initializePages() {
    pages = [
      PageItem(
        hasAppBar: true,
        widget: HomeMain(tabs: tabs, tabController: tabController),
      ),
      PageItem(
        hasAppBar: false,
        widget: MultiBlocProvider(
          providers: khoPhimProviders,
          child: const KhoPhimPage(),
        ),
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
    scrollControllers = List.generate(_tabCount, (index) => ScrollController());
  }

  void _disposeControllers() {
    for (final controller in scrollControllers) {
      controller.dispose();
    }
    tabController.dispose();
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBloc(),
      //TODO FIND THE WAY TO NOT RELOAD PAGES WHEN CHANGE BOTTOM NAV PAGE
      child: BlocBuilder<BottomNavBloc, BottomNavState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          if (state is! HomeInitialBottomNav) {
            return const SizedBox.shrink();
          }
          final currentPage = pages[state.currentPage];
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
                  currentIndex: state.currentPage,
                  onTap: (int i) => Helper.changeBottomNavIndex(context, i),
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
                body: currentPage.widget,
              ),
            ),
          );
        },
      ),
    );
  }
}
