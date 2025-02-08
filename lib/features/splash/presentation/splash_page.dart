import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/features/splash/bloc/splash_bloc.dart';
import 'package:smoth_movie_app/router/app_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is AfterDelayState) {
            Navigator.of(context).pushReplacementNamed(AppRouter.homePage);
          }
        },
        child: Center(
          child: Image.asset(
            'assets/images/logo_dark.png',
            scale: 0.9,
          ),
        ),
      ),
    );
  }
}
