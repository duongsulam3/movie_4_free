import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/widgets/progress_indicator.dart';
import 'package:smoth_movie_app/common/widgets/responsive_sized_box.dart';
import 'package:smoth_movie_app/core/bloc/kho_phim/categories_state_status.dart';
import 'package:smoth_movie_app/core/error/error_page.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/bloc/categories/category_list_bloc.dart';
import 'package:smoth_movie_app/features/kho_phim/presentation/widget/categories_item_container.dart';

class KhoPhimCategoriesWidget extends StatefulWidget {
  const KhoPhimCategoriesWidget({super.key, required this.onSelected});

  final ValueChanged<String> onSelected;

  @override
  State<KhoPhimCategoriesWidget> createState() =>
      _KhoPhimCategoriesWidgetState();
}

class _KhoPhimCategoriesWidgetState extends State<KhoPhimCategoriesWidget> {
  late int selectedIndex;

  @override
  void initState() {
    selectedIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryListBloc, CategoryListState>(
      //** Listen when success return the first category slug */
      listenWhen: (previous, current) =>
          current.status == CategoriesStateStatus.success,
      listener: (context, state) {
        if (state.status == CategoriesStateStatus.success) {
          widget.onSelected(state.categories[selectedIndex].slug);
        }
      },
      //** Listen when success return the first category slug */
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
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      widget.onSelected(state.categories[index].slug);
                    });
                  },
                  child: CategoriesItemContainer(
                    name: state.categories[index].name,
                    backgroundColor: selectedIndex == index
                        ? Colors.grey.withValues(alpha: 0.2)
                        : Colors.transparent,
                    textColor: selectedIndex == index
                        ? Colors.green.withValues(alpha: 0.8)
                        : Colors.white,
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
