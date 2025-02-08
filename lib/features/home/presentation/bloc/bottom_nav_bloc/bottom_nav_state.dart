part of 'bottom_nav_bloc.dart';

@immutable
sealed class BottomNavState {
  final int currentPage;
  const BottomNavState({required this.currentPage});
}

final class HomeInitialBottomNav extends BottomNavState {
  const HomeInitialBottomNav({super.currentPage = 0});
}
