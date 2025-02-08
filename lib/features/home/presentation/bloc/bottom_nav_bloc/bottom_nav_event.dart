part of 'bottom_nav_bloc.dart';

@immutable
sealed class BottomNavEvent {}

class HomeChangeBottomNavStateEvent extends BottomNavEvent {
  final int index;
  HomeChangeBottomNavStateEvent({required this.index});
}
