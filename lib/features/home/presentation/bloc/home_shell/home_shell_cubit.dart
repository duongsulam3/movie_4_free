import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_shell_state.dart';

class HomeShellCubit extends Cubit<HomeShellState> {
  HomeShellCubit() : super(const HomeShellState());

  void changeBottomIndex(int index) {
    if (state.currentBottomIndex == index) return;
    emit(state.copyWith(currentBottomIndex: index));
  }

  void markTopTabInitialized(int tabIndex) {
    if (state.initializedTopTabs.contains(tabIndex)) return;
    emit(state.copyWith(
      initializedTopTabs: {...state.initializedTopTabs, tabIndex},
    ));
  }

  bool isTopTabInitialized(int tabIndex) {
    return state.isTopTabInitialized(tabIndex);
  }
}
