import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/widgets/animated_state_switcher.dart';
import '../../enum/home_category.dart';
import '../../home_main/tabs/categories_tab.dart';
import '../../home_main/tabs/home_main_content.dart';
import '../bloc/home_shell/home_shell_cubit.dart';
import '../bloc/home_shell/home_shell_state.dart';

class HomeTopTabContent extends StatelessWidget {
  const HomeTopTabContent({
    super.key,
    required this.index,
    required this.category,
    required this.scrollController,
    required this.tabController,
  });

  final int index;
  final HomeCategoryTab category;
  final ScrollController scrollController;
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    if (category == HomeCategoryTab.home) {
      return HomeMainContent(
        scrollController: scrollController,
        tabController: tabController,
      );
    }
    return BlocBuilder<HomeShellCubit, HomeShellState>(
      buildWhen: (p, c) => p.initializedTopTabs != c.initializedTopTabs,
      builder: (context, state) {
        final isInitialized = state.isTopTabInitialized(index);
        return AnimatedStateSwitcher(
          switchKey: isInitialized,
          child: isInitialized
              ? CategoriesTab(
                  scrollController: scrollController,
                  path: category.slug,
                )
              : const SizedBox.shrink(),
        );
      },
    );
  }
}
