abstract class DictionaryError implements Exception {}

class DictionaryFileNotFoundError extends DictionaryError {}

class DictionaryEmptyError extends DictionaryError {}

class DictionaryLoadError extends DictionaryError {}

class DictionaryParseError extends DictionaryError {} 