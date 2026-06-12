import 'package:flutter_supper_app_core/core.dart';
import 'package:smoth_movie_app/common/di/init_dependencies.dart';
import 'package:smoth_movie_app/l10n/localization/app_localizations.dart';

import 'common/router/app_router.dart';
import 'common/utils/theme/theme.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter route = AppRouter();
  late final _localeController = serviceLocator<AbstractLocaleController>();

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return ListenableBuilder(
          listenable: _localeController,
          builder: (context, _) {
            return MaterialApp(
              title: 'Movies For Free',
              debugShowCheckedModeBanner: false,
              locale: _localeController.value,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              theme: AppTheme.blackTheme,
              initialRoute: AppRouter.splash,
              onGenerateRoute: route.onGenerateRoute,
              onUnknownRoute: route.unknownRoute,
            );
          },
        );
      },
    );
  }
}
