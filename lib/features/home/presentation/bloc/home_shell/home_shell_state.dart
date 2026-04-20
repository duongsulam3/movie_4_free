import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_shell_state.freezed.dart';

@freezed
abstract class HomeShellState with _$HomeShellState {
  const HomeShellState._();

  const factory HomeShellState({
    @Default(0) int currentBottomIndex,
    @Default({0}) Set<int> initializedTopTabs,
  }) = _HomeShellState;

  bool isTopTabInitialized(int tabIndex) {
    return initializedTopTabs.contains(tabIndex);
  }
}
