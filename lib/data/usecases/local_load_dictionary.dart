import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:free_dictionary/core/core.dart';
import 'package:free_dictionary/domain/domain.dart';

class LocalLoadDictionary implements LoadDictionary {
  @override
  Future<List<String>> call() async {
    try {
      final jsonString = await rootBundle.loadString(
        'assets/words_dictionary.json',
      );
      final dictionary = jsonDecode(jsonString);

      if (dictionary == null || dictionary.isEmpty) {
        throw DictionaryEmptyError();
      }

      return dictionary.keys.toList();
    } catch (error) {
      if (error is DictionaryError) rethrow;

      if (error.toString().contains('Unable to load asset')) {
        throw DictionaryFileNotFoundError();
      }
      throw DictionaryLoadError();
    }
  }
}
