import 'package:flutter/material.dart';
import 'package:smoth_movie_app/core/router/params/search_textfield_param_model.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';
import 'package:smoth_movie_app/core/router/app_router.dart';

class TitleAndSearchIcon extends StatelessWidget {
  const TitleAndSearchIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const ResponsiveText(text: "Kho Phim", fontSize: 24),
        const Spacer(),
        GestureDetector(
            onTap: () => Navigator.of(context).pushNamed(
                  AppRouter.homeSearch,
                  arguments: const SearchTextfieldParamModel(
                    searchHint: "Nhập phim bạn muốn tìm",
                    //TODO IF THE LIST SEARCH CHANGE UPDATE LIST SEARCH FOR SYNC
                    listSearch: [
                      "Avatar: The Way of Water",
                      "The Flash",
                      "The Batman",
                      "Loki Season 2",
                      "Stranger Things",
                      "The Witcher",
                      "Jujutsu Kaisen",
                      "Naruto Shippuden",
                    ],
                  ),
                ),
            child: const Icon(Icons.search)),
      ],
    );
  }
}
