import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/widgets/progress_indicator.dart';
import 'package:smoth_movie_app/common/widgets/responsive_sized_box.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';
import 'package:smoth_movie_app/core/bloc/categories_state_status.dart';
import 'package:smoth_movie_app/core/error/error_page.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/bloc/category_list_bloc.dart';
import 'package:smoth_movie_app/init_dependencies.dart';

class KhoPhimCategoriesWidget extends StatelessWidget {
  const KhoPhimCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryListBloc, CategoryListState>(
      bloc: serviceLocator<CategoryListBloc>()..add(const GetAllCategories()),
      builder: (context, state) {
        switch (state.status) {
          case CategoriesStateStatus.init:
            return const SizedBox.shrink();
          case CategoriesStateStatus.loading:
            return const Center(child: ProgressIndicatorCustom());
          case CategoriesStateStatus.error:
            return const ErrorPage();
          default:
            return ResponsiveSizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: ResponsiveText(
                      text: state.categories[index].name,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      textColor: Colors.white,
                    ),
                  ),
                ),
                itemCount: state.categories.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const ResponsiveSizedBox(width: 10),
              ),
            );
        }
      },
    );
  }
}
