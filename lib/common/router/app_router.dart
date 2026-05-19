import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_supper_app_core/core.dart';

import '../../features/home/presentation/home_page.dart';
import '../../features/home/presentation/scope/home_bootstrap_scope.dart';
import '../../features/movie_detail/presentation/bloc/detail_movie/detail_movie_bloc.dart';
import '../../features/movie_detail/presentation/detail_page.dart';
import '../../features/profile/page.dart';
import '../../features/search/presentation/page.dart';
import '../../features/search/presentation/scope/search_bootstrap_scope.dart';
import '../../features/splash/bloc/splash_bloc.dart';
import '../../features/splash/presentation/splash_page.dart';
import '../di/init_dependencies.dart';
import '../screens/error_page.dart';
import 'custom_transitions/fade_in_transition.dart';
import 'custom_transitions/slide_bottom_to_top_transition.dart';
import 'params/movie_detail_param_model.dart';
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
        return _buildSplashRoute();
      case homePage:
        return _buildHomeRoute(settings.name);
      case homeSearch:
        return _buildSearchRoute(settings.arguments);
      case homeProfile:
        return _buildProfileRoute();
      case movieDetail:
        return _buildMovieDetailRoute(settings.arguments, settings.name);
      default:
        return null;
    }
  }

  Route<dynamic> _buildSplashRoute() {
    return MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (_) => SplashBloc()..add(GetToHomePageEvent()),
        child: const SplashPage(),
      ),
    );
  }

  Route<dynamic> _buildHomeRoute(String? routeName) {
    return SlideBottomToTopTransition(
      page: const HomeBootstrapScope(child: HomePage()),
      routeName: routeName,
      dx: 1.0,
      dy: 0.0,
    );
  }

  Route<dynamic> _buildSearchRoute(Object? arguments) {
    final params = arguments as SearchTextfieldParamModel;
    return FadeInTransition(
      page: SearchBootstrapScope(
        child: SearchPage(
          searchHint: params.searchHint,
          listSearch: params.listSearch,
        ),
      ),
    );
  }

  Route<dynamic> _buildProfileRoute() {
    return MaterialPageRoute(builder: (_) => const ProfilePage());
  }

  Route<dynamic> _buildMovieDetailRoute(Object? arguments, String? routeName) {
    final params = arguments as MovieDetailParamModel;
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
        routeName: routeName,
        dx: 0.0,
        dy: 1.0,
      );
    }
  }

  @override
  Route<dynamic> unknownRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (_) => const ErrorPage());
  }
}
