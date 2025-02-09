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
import 'package:smoth_movie_app/features/movies/presentation/bloc/list_movie_item_bloc/list_movie_item_bloc.dart';
import 'package:smoth_movie_app/init_dependencies.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //
    List<Map<String, dynamic>> pages = [
      {
        "page": BlocProvider(
          create: (context) => serviceLocator<ListMovieItemBloc>(),
          child: const HomeMain(),
        ),
        "appBar": false,
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
        "appBar": true,
      },
    ];
    //
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
              child: Scaffold(
                extendBodyBehindAppBar: true,
                appBar: pages[state.currentPage]["appBar"] == true
                    ? CustomAppbarWidget(
                        appBarHeight: sHeight / (sHeight / 50),
                        backgroundColor: Colors.transparent,
                        titleWidget: const ResponsiveText(
                          text: "Smoth Movie App",
                          fontSize: 24,
                        ),
                      )
                    : null,
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: state.currentPage,
                  onTap: (int i) {
                    context
                        .read<BottomNavBloc>()
                        .add(HomeChangeBottomNavStateEvent(index: i));
                  },
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.house),
                      activeIcon: Icon(CupertinoIcons.house_fill),
                      label: "Trang chủ",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.search_circle),
                      activeIcon: Icon(CupertinoIcons.search_circle_fill),
                      label: "Tìm kiếm",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.person_2),
                      activeIcon: Icon(CupertinoIcons.person_2_fill),
                      label: "Người dùng",
                    ),
                  ],
                ),
                body: pages[state.currentPage]["page"],
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
