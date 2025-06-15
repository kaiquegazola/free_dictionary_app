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

  @override
  String get wordDefinition => 'Definição da Palavra';

  @override
  String get partOfSpeech => 'Classe Gramatical';

  @override
  String get definition => 'Definição';

  @override
  String get example => 'Exemplo';

  @override
  String get synonyms => 'Sinônimos';

  @override
  String get antonyms => 'Antônimos';

  @override
  String get wordNotFoundTitle => 'Palavra não encontrada';

  @override
  String wordNotFoundMessage(String word) {
    return 'Não encontramos definições para \"$word\"';
  }

  @override
  String get goBack => 'Voltar';

  @override
  String get noWordFound => 'Nenhuma palavra encontrada';

  @override
  String get historyScreen => 'Tela de Histórico';

  @override
  String get portuguese => 'Português';

  @override
  String get english => 'Inglês';

  @override
  String errorWithMessage(String message) {
    return 'Erro: $message';
  }

  @override
  String get noWordsFound => 'Nenhuma palavra encontrada';

  @override
  String get exampleLabel => 'Exemplo:';

  @override
  String get synonymsLabel => 'Sinônimos:';

  @override
  String get antonymsLabel => 'Antônimos:';

  @override
  String get clear => 'Limpar';

  @override
  String get previous => 'Anterior';

  @override
  String get next => 'Próximo';

  @override
  String get brazilFlag => '🇧🇷';

  @override
  String get usaFlag => '🇺🇸';

  @override
  String get showAsList => 'Mostrar como lista';

  @override
  String get showAsGrid => 'Mostrar como grade';

  @override
  String favoriteWordsCount(int count) {
    return '$count palavras favoritas';
  }

  @override
  String get noFavoriteWords => 'Nenhuma palavra favorita';

  @override
  String get addFavoritesToSeeHere =>
      'Adicione palavras aos favoritos para vê-las aqui';

  @override
  String get noFavorites => 'Nenhuma palavra favorita ainda';

  @override
  String get noHistory => 'Nenhum histórico de busca ainda';
}
