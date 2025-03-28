import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/route_params_model/search_textfield_param_model.dart';
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
                  ),
                ),
            child: const Icon(Icons.search)),
      ],
    );
  }
}
