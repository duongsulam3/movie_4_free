import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:smoth_movie_app/features/home/home_main/tabs/anime_tab.dart';
import 'package:smoth_movie_app/features/home/home_main/tabs/home_main_content.dart';
import 'package:smoth_movie_app/features/home/home_main/tabs/phim_bo_tab.dart';
import 'package:smoth_movie_app/features/home/home_main/tabs/phim_le_tab.dart';
import 'package:smoth_movie_app/features/home/home_main/tabs/phim_truyen_hinh_tab.dart';

class HomeMain extends StatelessWidget {
  final ScrollController? scrollController;
  const HomeMain({super.key, this.scrollController});

  @override
  Widget build(BuildContext context) {
    log("Rebuilding");
    final sHeight = MediaQuery.of(context).size.height;
    // final sWidth = MediaQuery.of(context).size.width;
    return TabBarView(
      children: [
        HomeMainContent(scrollController: scrollController, sHeight: sHeight),
        const AnimeTab(),
        const PhimLeTab(),
        const PhimBoTab(),
        const PhimTruyenHinhTab(),
      ],
    );
  }
}
