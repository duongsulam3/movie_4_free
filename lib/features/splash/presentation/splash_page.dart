import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:smoth_movie_app/common/widgets/lottie_asset_widget.dart';
import 'package:smoth_movie_app/core/constants/app_constants.dart';
import 'package:smoth_movie_app/features/splash/bloc/splash_bloc.dart';
import 'package:smoth_movie_app/core/router/app_router.dart';

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
        child: const Center(
          child: LottieAssetWidget(
            assetString: AppConstants.movieTickerPlayer,
            renderCache: RenderCache.drawingCommands,
          ),
        ),
      ),
    );
  }
}
