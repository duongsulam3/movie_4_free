import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/widgets/custom_appbar_widget.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';
import 'package:smoth_movie_app/features/home/presentation/bloc/bottom_nav/bottom_nav_bloc.dart';
import 'package:smoth_movie_app/features/home/home_main/page.dart';
import 'package:smoth_movie_app/features/home/home_profile/page.dart';
import 'package:smoth_movie_app/features/home/home_search/presentation/bloc/search_bloc.dart';
import 'package:smoth_movie_app/features/home/home_search/presentation/page.dart';
import 'package:smoth_movie_app/features/home/presentation/widgets/logo_and_widget.dart';
import 'package:smoth_movie_app/features/movies/presentation/bloc/list_movie_item_bloc/list_movie_item_bloc.dart';
import 'package:smoth_movie_app/init_dependencies.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bottomNavBloc = BottomNavBloc();
  List<Map<String, dynamic>> pages = [];
  List<Map<String, dynamic>> tabs = [];
  List<Map<String, dynamic>> navs = [];
  final scrollController = ScrollController();

  @override
  void initState() {
    tabs = [
      {"title": "Trang chủ"},
      {"title": "Anime"},
      {"title": "Phim lẻ"},
      {"title": "Phim bộ"},
      {"title": "Phim truyền hình"},
    ];
    pages = [
      {
        "page": BlocProvider(
          create: (context) => serviceLocator<ListMovieItemBloc>(),
          child: HomeMain(scrollController: scrollController),
        ),
        "appBar": true,
      },
      {
        "page": BlocProvider(
          create: (context) => serviceLocator<SearchBloc>(),
          child: const SearchPage(),
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
        "icon": const Icon(CupertinoIcons.search),
        "active_icon": const Icon(CupertinoIcons.search),
        "title": "Tìm kiếm",
      },
      {
        "icon": const Icon(CupertinoIcons.person),
        "active_icon": const Icon(CupertinoIcons.person_fill),
        "title": "Tài khoản",
      },
    ];
    super.initState();
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
            /* Change Page On Tap Function */
            void onTap(int index) {
              context
                  .read<BottomNavBloc>()
                  .add(HomeChangeBottomNavStateEvent(index: index));
            }

            return SafeArea(
              bottom: false,
              right: false,
              left: false,
              child: DefaultTabController(
                length: tabs.length,
                child: Scaffold(
                  extendBodyBehindAppBar: true,
                  appBar: pages[state.currentPage]["appBar"] == true
                      ? CustomAppbarWidget(
                          scrollController: scrollController,
                          appBarHeight: sHeight / (sHeight / 80),
                          backgroundColor: Colors.black,
                          titleWidget: LogoAndWidget(sHeight: sHeight),
                          appBarBottomWidget: PreferredSize(
                            preferredSize: Size.fromHeight(
                              sHeight / (sHeight / 30),
                            ),
                            child: TabBar(
                              isScrollable: true,
                              tabAlignment: TabAlignment.start,
                              indicatorColor: Colors.transparent,
                              dividerColor: Colors.transparent,
                              tabs: List.generate(
                                tabs.length,
                                (i) => Tab(
                                  child: ResponsiveText(
                                    text: tabs[i]["title"],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : null,
                  bottomNavigationBar: BottomNavigationBar(
                    currentIndex: state.currentPage,
                    onTap: (int i) => onTap(i),
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
