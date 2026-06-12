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
  // Initialize dependencies
  final AppRouter route = AppRouter();

  // Initialize locale controller
  late final _localeController = serviceLocator<AbstractLocaleController>();

  @override
  Widget build(BuildContext context) {
    /// Responsive builder
    return Sizer(
      builder: (context, orientation, deviceType) {
        /// Locale builder
        return ListenableBuilder(
          listenable: _localeController,
          builder: (context, _) {
            /// Main material app
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
