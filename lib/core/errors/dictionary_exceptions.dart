import 'generic_exception.dart';

abstract class DictionaryError extends GenericException {}

class DictionaryFileNotFoundError extends DictionaryError {}

class DictionaryEmptyError extends DictionaryError {}

class DictionaryLoadError extends DictionaryError {}

class DictionaryParseError extends DictionaryError {}
