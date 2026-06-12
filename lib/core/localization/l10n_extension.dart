import 'package:flutter/material.dart';
import 'package:smoth_movie_app/core/localization/app_localizations.dart';

extension L10nX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;

  Locale get locale => Localizations.localeOf(this);
}
