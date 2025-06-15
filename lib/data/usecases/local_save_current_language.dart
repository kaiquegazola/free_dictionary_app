import 'package:flutter/material.dart';
import 'package:free_dictionary/core/storage/storage.dart';
import 'package:free_dictionary/domain/usecases/save_current_language.dart';

class LocalSaveCurrentLanguage implements SaveCurrentLanguage {
  LocalSaveCurrentLanguage({required this.storage});

  final Storage storage;

  static const _key = 'current_language';

  @override
  Future<void> call(Locale locale) async {
    final languageCode = locale.countryCode != null
        ? '${locale.languageCode}_${locale.countryCode}'
        : locale.languageCode;
    await storage.setString(_key, languageCode);
  }
}
