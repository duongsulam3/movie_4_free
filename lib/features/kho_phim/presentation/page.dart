import 'package:flutter/material.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/widget/kho_phim_categories_widget.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/widget/title_and_search_icon.dart';

class KhoPhimPage extends StatelessWidget {
  const KhoPhimPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          TitleAndSearchIcon(),
          KhoPhimCategoriesWidget(),
        ],
      ),
    );
  }
}


