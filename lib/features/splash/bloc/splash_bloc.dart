import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<GetToHomePageEvent>(getToHomePageEvent);
  }

  Future<void> getToHomePageEvent(
    GetToHomePageEvent event,
    Emitter<SplashState> emit,
  ) async {
    await Future.delayed(const Duration(seconds: 5));
    emit(AfterDelayState());
  }
}
