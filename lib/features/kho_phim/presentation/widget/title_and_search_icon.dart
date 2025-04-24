import 'package:flutter/material.dart';
import 'package:smoth_movie_app/core/router/params/search_textfield_param_model.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';
import 'package:smoth_movie_app/core/router/app_router.dart';

class TitleAndSearchIcon extends StatelessWidget {
  const TitleAndSearchIcon({super.key, this.hint});

  final List<String>? hint;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const ResponsiveText(text: "Kho Phim", fontSize: 24),
        const Spacer(),
        GestureDetector(
            onTap: () => Navigator.of(context).pushNamed(
                  AppRouter.homeSearch,
                  arguments: SearchTextfieldParamModel(
                    searchHint: "Nhập phim bạn muốn tìm",
                    listSearch: hint ?? [],
                  ),
                ),
            child: const Icon(Icons.search)),
      ],
    );
  }
}
