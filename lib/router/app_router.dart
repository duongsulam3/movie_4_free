import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/model/movie_detail_param_model.dart';
import 'package:smoth_movie_app/core/error/error_page.dart';
import 'package:smoth_movie_app/features/home/home_main/page.dart';
import 'package:smoth_movie_app/features/home/home_profile/page.dart';
import 'package:smoth_movie_app/features/home/home_search/presentation/page.dart';
import 'package:smoth_movie_app/features/home/presentation/home_page.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/blocs/detail_movie_bloc/detail_movie_bloc.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/detail_page.dart';
import 'package:smoth_movie_app/features/splash/bloc/splash_bloc.dart';
import 'package:smoth_movie_app/features/splash/presentation/splash_page.dart';
import 'package:smoth_movie_app/init_dependencies.dart';
import 'package:smoth_movie_app/router/custom_transitions/custome_transition.dart';

class AppRouter {
  static const String splash = '/';
  static const String homePage = '/home';
  static const String homeMain = 'home_main';
  static const String homeSearch = 'home_search';
  static const String homeProfile = 'home_profile';

  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => SplashBloc()..add(GetToHomePageEvent()),
            child: const SplashPage(),
          ),
        );
      case '/home':
        return CustomTransition(
          page: const HomePage(),
          routeName: settings.name,
          dx: 1.0,
          dy: 0.0,
        );
      case 'home_main':
        return MaterialPageRoute(builder: (_) => const HomeMain());
      case 'home_search':
        return MaterialPageRoute(builder: (_) => const SearchPage());
      case 'home_profile':
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case 'movie_detail':
        final params = settings.arguments as MovieDetailParamModel;
        return CustomTransition(
          page: BlocProvider(
            create: (context) => serviceLocator<DetailMovieBloc>(),
            child: MovieDetailPage(
              slug: params.slug,
            ),
          ),
          routeName: settings.name,
          dx: 0.0,
          dy: 1.0,
        );
      default:
        return MaterialPageRoute(builder: (_) => const ErrorPage());
    }
  }
}
