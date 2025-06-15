// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Free Dictionary';

  @override
  String get wordList => 'Word List';

  @override
  String get history => 'History';

  @override
  String get favorites => 'Favorites';

  @override
  String get search => 'Search';

  @override
  String get noResults => 'No results found';

  @override
  String get error => 'Error';

  @override
  String get tryAgain => 'Try Again';

  @override
  String get wordDefinition => 'Word Definition';

  @override
  String get partOfSpeech => 'Part of Speech';

  @override
  String get definition => 'Definition';

  @override
  String get example => 'Example';

  @override
  String get synonyms => 'Synonyms';

  @override
  String get antonyms => 'Antonyms';

  @override
  String get wordNotFoundTitle => 'Word not found';

  @override
  String wordNotFoundMessage(String word) {
    return 'We couldn\'t find any definitions for \"$word\"';
  }

  @override
  String get goBack => 'Go Back';

  @override
  String get noWordFound => 'No word found';

  @override
  String get historyScreen => 'History Screen';

  @override
  String get portuguese => 'Portuguese';

  @override
  String get english => 'English';

  @override
  String errorWithMessage(String message) {
    return 'Error: $message';
  }

  @override
  String get noWordsFound => 'No words found';

  @override
  String get exampleLabel => 'Example:';

  @override
  String get synonymsLabel => 'Synonyms:';

  @override
  String get antonymsLabel => 'Antonyms:';

  @override
  String get clear => 'Clear';

  @override
  String get previous => 'Previous';

  @override
  String get next => 'Next';

  @override
  String get brazilFlag => '🇧🇷';

  @override
  String get usaFlag => '🇺🇸';

  @override
  String get showAsList => 'Show as list';

  @override
  String get showAsGrid => 'Show as grid';

  @override
  String favoriteWordsCount(int count) {
    return '$count favorite words';
  }

  @override
  String get noFavoriteWords => 'No favorite words';

  @override
  String get addFavoritesToSeeHere => 'Add words to favorites to see them here';
}
