import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/core/router/params/movie_detail_param_model.dart';
import 'package:smoth_movie_app/core/router/params/nguonc_movie_detail_params_model.dart';
import 'package:smoth_movie_app/core/router/params/search_textfield_param_model.dart';
import 'package:smoth_movie_app/common/screens/error_page.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/bloc/detail_movie/detail_movie_bloc.dart';
import 'package:smoth_movie_app/features/nguonc_movie_detail/presentation/bloc/nguonc_movie_detail_bloc.dart';
import 'package:smoth_movie_app/features/nguonc_movie_detail/presentation/widget/nguonc_detail_page.dart';
import 'package:smoth_movie_app/features/nguonc_search_movies/presentation/bloc/nguonc_search_bloc.dart';
import 'package:smoth_movie_app/features/profile/page.dart';
import 'package:smoth_movie_app/features/search/presentation/bloc/search_bloc.dart';
import 'package:smoth_movie_app/features/search/presentation/page.dart';
import 'package:smoth_movie_app/features/home/presentation/home_page.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/detail_page.dart';
import 'package:smoth_movie_app/features/splash/bloc/splash_bloc.dart';
import 'package:smoth_movie_app/features/splash/presentation/splash_page.dart';
import 'package:smoth_movie_app/init_dependencies.dart';
import 'package:smoth_movie_app/core/router/custom_transitions/fade_in_transition.dart';
import 'package:smoth_movie_app/core/router/custom_transitions/slide_bottom_to_top_transition.dart';

class AppRouter {
  static const String splash = '/';
  static const String homePage = '/home';
  static const String homeSearch = '/home_search';
  static const String homeProfile = '/home_profile';
  static const String movieDetail = '/movie_detail';
  static const String nguoncMovieDetail = '/nguonc_movie_detail';

  Route onGenerateRoute(RouteSettings settings) {
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
          page: const HomePage(),
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
        return MaterialPageRoute(builder: (_) => const ErrorPage());
    }
  }
}
