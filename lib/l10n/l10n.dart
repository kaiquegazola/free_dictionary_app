import 'package:free_dictionary/l10n/app_localizations.dart';
import 'package:free_dictionary/l10n/app_localizations_pt.dart';

AppLocalizations get l10n {
  try {
    return _currentL10n;
  } catch (e) {
    return AppLocalizationsPt();
  }
}

late AppLocalizations _currentL10n;

void setL10n(AppLocalizations localizations) {
  _currentL10n = localizations;
}
