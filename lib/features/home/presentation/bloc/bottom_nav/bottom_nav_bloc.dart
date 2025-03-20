import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_nav_event.dart';
part 'bottom_nav_state.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  //TODO REFACTOR BLOC STATE
  BottomNavBloc() : super(const HomeInitialBottomNav(currentPage: 0)) {
    on<HomeChangeBottomNavStateEvent>((event, emit) {
      emit(HomeInitialBottomNav(currentPage: event.index));
    });
  }

}
