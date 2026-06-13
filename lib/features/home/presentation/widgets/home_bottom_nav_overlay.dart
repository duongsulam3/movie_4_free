import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_supper_app_core/core.dart';

import '../../enum/bottom_navigation_tab.dart';
import '../bloc/home_shell/home_shell_cubit.dart';
import '../bloc/home_shell/home_shell_state.dart';
import 'custom_bottom_navigation_bar.dart';

class HomeBottomNavOverlay extends StatelessWidget {
  const HomeBottomNavOverlay({
    super.key,
    required this.onItemSelected,
    this.height = 56.0,
  });

  final ValueChanged<int> onItemSelected;
  final double height;

  static List<BottomNavigationBarItem> _bottomNavItems(BuildContext context) {
    return List.generate(
      HomeBottomNav.values.length,
      (i) => BottomNavigationBarItem(
        label: HomeBottomNav.values[i].getTitle(context),
        icon: HomeBottomNav.values[i].icon,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeShellCubit, HomeShellState, int>(
      selector: (state) => state.currentBottomIndex,
      builder: (context, currentBottomIndex) {
        return CustomBottomNavigationBar(
          items: _bottomNavItems(context),
          onItemSelected: onItemSelected,
          currentIndex: currentBottomIndex,
          height: height.v,
          iconColor: Colors.red.withValues(alpha: 0.8),
        );
      },
    );
  }
}
