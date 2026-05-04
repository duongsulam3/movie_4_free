import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_core/core.dart';

import '../../features/home/presentation/home_page.dart';
import '../../features/home/presentation/scope/home_bootstrap_scope.dart';
import '../../features/movie_detail/presentation/bloc/detail_movie/detail_movie_bloc.dart';
import '../../features/movie_detail/presentation/detail_page.dart';
import '../../features/nguonc_movie_detail/presentation/bloc/nguonc_movie_detail_bloc.dart';
import '../../features/nguonc_movie_detail/presentation/widget/nguonc_detail_page.dart';
import '../../features/nguonc_search_movies/presentation/bloc/nguonc_search_bloc.dart';
import '../../features/profile/page.dart';
import '../../features/search/presentation/bloc/search_bloc.dart';
import '../../features/search/presentation/page.dart';
import '../../features/splash/bloc/splash_bloc.dart';
import '../../features/splash/presentation/splash_page.dart';
import '../di/init_dependencies.dart';
import '../screens/error_page.dart';
import 'custom_transitions/fade_in_transition.dart';
import 'custom_transitions/slide_bottom_to_top_transition.dart';
import 'params/movie_detail_param_model.dart';
import 'params/nguonc_movie_detail_params_model.dart';
import 'params/search_textfield_param_model.dart';

class AppRouter extends SuperAppRoute {
  static const String splash = '/';
  static const String homePage = '/home';
  static const String homeSearch = '/home_search';
  static const String homeProfile = '/home_profile';
  static const String movieDetail = '/movie_detail';
  static const String nguoncMovieDetail = '/nguonc_movie_detail';

  @override
  Route<dynamic>? resolveRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => SplashBloc()..add(GetToHomePageEvent()),
            child: const SplashPage(),
          ),
        );
      case homePage:
        return SlideBottomToTopTransition(
          page: const HomeBootstrapScope(child: HomePage()),
          routeName: settings.name,
          dx: 1.0,
          dy: 0.0,
        );
      case homeSearch:
        final params = settings.arguments as SearchTextfieldParamModel;
        final providers = <BlocProvider>[
          BlocProvider<SearchBloc>(create: (context) => serviceLocator()),
          BlocProvider<NguoncSearchBloc>(create: (context) => serviceLocator()),
        ];
        return FadeInTransition(
          page: MultiBlocProvider(
            providers: providers,
            child: SearchPage(
              searchHint: params.searchHint,
              listSearch: params.listSearch,
            ),
          ),
        );
      case homeProfile:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case movieDetail:
        final params = settings.arguments as MovieDetailParamModel;
        if (params.hasHeroEffect) {
          return MaterialPageRoute(
            builder: (_) => BlocProvider<DetailMovieBloc>(
              create: (context) => serviceLocator(),
              child: MovieDetailPage(movie: params.movie, tag: params.tag),
            ),
          );
        } else {
          return SlideBottomToTopTransition(
            page: BlocProvider<DetailMovieBloc>(
              create: (context) => serviceLocator(),
              child: MovieDetailPage(movie: params.movie),
            ),
            routeName: settings.name,
            dx: 0.0,
            dy: 1.0,
          );
        }
      case nguoncMovieDetail:
        final params = settings.arguments as NguoncMovieDetailParamsModel;
        if (params.hasHeroEffect) {
          return MaterialPageRoute(
            builder: (context) => BlocProvider<NguoncMovieDetailBloc>(
              create: (context) => serviceLocator(),
              child: NguoncDetailPage(movie: params.movie, tag: params.tag),
            ),
          );
        } else {
          return SlideBottomToTopTransition(
            page: BlocProvider<NguoncMovieDetailBloc>(
              create: (context) => serviceLocator(),
              child: NguoncDetailPage(movie: params.movie),
            ),
            routeName: settings.name,
            dx: 0.0,
            dy: 1.0,
          );
        }
      default:
        return null;
    }
  }

  @override
  Route<dynamic> unknownRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (_) => const ErrorPage());
  }
}
