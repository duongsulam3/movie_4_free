import 'package:flutter/material.dart';
import 'package:smoth_movie_app/core/locale/locale_repository.dart';

class LocaleController extends ValueNotifier<Locale> {
  LocaleController({required LocaleRepository repository})
      : _repository = repository,
        super(_resolveInitial(repository));

  final LocaleRepository _repository;

  static const supportedLocales = <Locale>[Locale('vi'), Locale('en')];
  static const fallback = Locale('vi');

  static Locale _resolveInitial(LocaleRepository repository) {
    final stored = repository.load();
    if (stored == null) return fallback;
    return supportedLocales.firstWhere(
      (locale) => locale.languageCode == stored,
      orElse: () => fallback,
    );
  }

  Future<void> setLocale(Locale locale) async {
    if (locale.languageCode == value.languageCode) return;
    final isSupported = supportedLocales.any(
      (item) => item.languageCode == locale.languageCode,
    );
    if (!isSupported) return;
    await _repository.save(locale.languageCode);
    value = locale;
  }
}
