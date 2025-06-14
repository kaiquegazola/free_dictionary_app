// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Dicionário';

  @override
  String get wordList => 'Palavras';

  @override
  String get history => 'Histórico';

  @override
  String get favorites => 'Favoritos';

  @override
  String get search => 'Buscar';

  @override
  String get noResults => 'Nenhum resultado encontrado';

  @override
  String get error => 'Erro';

  @override
  String get tryAgain => 'Tentar Novamente';
}
