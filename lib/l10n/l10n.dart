import 'package:flutter/material.dart';
import 'package:free_dictionary/l10n/app_localizations.dart';
export 'app_localizations.dart';

final currentLocale = ValueNotifier<Locale>(const Locale('en', 'US'));
final l10nNotifier = ValueNotifier<AppLocalizations>(
  lookupAppLocalizations(currentLocale.value),
);

AppLocalizations get l10n => l10nNotifier.value;

void changeLanguage(Locale locale){
  l10nNotifier.value = lookupAppLocalizations(locale);
  currentLocale.value = locale;
}


