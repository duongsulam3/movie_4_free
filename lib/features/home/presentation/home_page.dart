import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/widgets/custom_appbar_widget.dart';
import 'package:smoth_movie_app/features/home/home_main/tabs/anime_tab.dart';
import 'package:smoth_movie_app/features/home/home_main/tabs/home_main_content.dart';
import 'package:smoth_movie_app/features/home/home_main/tabs/phim_bo_tab.dart';
import 'package:smoth_movie_app/features/home/home_main/tabs/phim_le_tab.dart';
import 'package:smoth_movie_app/features/home/home_main/tabs/phim_truyen_hinh_tab.dart';
import 'package:smoth_movie_app/features/home/presentation/bloc/bottom_nav/bottom_nav_bloc.dart';
import 'package:smoth_movie_app/features/home/home_main/page.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/bloc/kho_phim/kho_phim_page_bloc.dart';
import 'package:smoth_movie_app/features/profile/page.dart';
import 'package:smoth_movie_app/features/home/presentation/widgets/home_tab_bar.dart';
import 'package:smoth_movie_app/features/home/presentation/widgets/logo_and_widget.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/bloc/categories/category_list_bloc.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/bloc/countries/countries_bloc.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/page.dart';
import 'package:smoth_movie_app/features/movies/presentation/bloc/recently_update_movies/recently_update_movies_bloc.dart';
import 'package:smoth_movie_app/core/utils/helper/helper.dart';
import 'package:smoth_movie_app/init_dependencies.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List<Map<String, dynamic>> pages = [];
  List<Map<String, dynamic>> tabs = [];
  List<Map<String, dynamic>> navs = [];
  //** SCROLL CONTROLLERS */
  late ScrollController appbarScrollController;
  late TabController tabController;
  final List<ScrollController> scrollControllers = [];
  final initialIndex = 0;

  @override
  void initState() {
    for (int i = 0; i < 5; i++) {
      scrollControllers.add(ScrollController());
    }
    appbarScrollController = scrollControllers[initialIndex];
    tabs = [
      {
        "title": "Trang chủ",
        "widget": HomeMainContent(scrollController: scrollControllers[0]),
      },
      {
        "title": "Anime",
        "widget": AnimeTab(scrollController: scrollControllers[1]),
      },
      {
        "title": "Phim lẻ",
        "widget": PhimLeTab(scrollController: scrollControllers[2]),
      },
      {
        "title": "Phim bộ",
        "widget": PhimBoTab(scrollController: scrollControllers[3]),
      },
      {
        "title": "Phim truyền hình",
        "widget": PhimTruyenHinhTab(scrollController: scrollControllers[4]),
      },
    ];
    tabController = TabController(length: tabs.length, vsync: this);
    tabController.addListener(() {
      setState(() {
        appbarScrollController = scrollControllers[tabController.index];
      });
    });
    pages = [
      {
        "page": BlocProvider(
          create: (context) => serviceLocator<RecentlyUpdateMoviesBloc>(),
          child: HomeMain(tabs: tabs, tabController: tabController),
        ),
        "appBar": true,
      },
      {
        "page": MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => serviceLocator<CategoryListBloc>(),
            ),
            BlocProvider(
              create: (context) => serviceLocator<CountriesBloc>(),
            ),
            BlocProvider(
              create: (context) => KhoPhimPageBloc(
                countriesBloc: context.read<CountriesBloc>(),
                categoryListBloc: context.read<CategoryListBloc>(),
              ),
            )
          ],
          child: const KhoPhimPage(),
        ),
        "appBar": false,
      },
      {
        "page": const ProfilePage(),
        "appBar": false,
      },
    ];
    navs = [
      {
        "icon": const Icon(CupertinoIcons.house),
        "active_icon": const Icon(CupertinoIcons.house_fill),
        "title": "Trang chủ",
      },
      {
        "icon": const Icon(CupertinoIcons.arrowtriangle_right_square),
        "active_icon": const Icon(
          CupertinoIcons.arrowtriangle_right_square_fill,
        ),
        "title": "Kho phim",
      },
      {
        "icon": const Icon(CupertinoIcons.hand_thumbsup),
        "active_icon": const Icon(CupertinoIcons.hand_thumbsup_fill),
        "title": "Donate",
      },
    ];
    super.initState();
  }

  @override
  void dispose() {
    appbarScrollController.dispose();
    tabController.dispose();
    scrollControllers.map((element) => element.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.of(context).size.height;
    // final sWidth = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => BottomNavBloc(),
      child: BlocBuilder<BottomNavBloc, BottomNavState>(
        builder: (context, state) {
          if (state is HomeInitialBottomNav) {
            return SafeArea(
              bottom: false,
              right: false,
              left: false,
              child: DefaultTabController(
                initialIndex: initialIndex,
                length: tabs.length,
                child: Scaffold(
                  extendBodyBehindAppBar: true,
                  appBar: pages[state.currentPage]["appBar"] == true
                      ? CustomAppbarWidget(
                          scrollController: appbarScrollController,
                          appBarHeight: sHeight / (sHeight / 90),
                          backgroundColor: Colors.black,
                          titleWidget: const LogoAndWidget(),
                          appBarBottomWidget: PreferredSize(
                            preferredSize: Size.fromHeight(
                              sHeight / (sHeight / 30),
                            ),
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
                        icon: navs[i]["icon"],
                        activeIcon: navs[i]["active_icon"],
                        label: navs[i]["title"],
                      ),
                    ),
                  ),
                  body: pages[state.currentPage]["page"],
                ),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
