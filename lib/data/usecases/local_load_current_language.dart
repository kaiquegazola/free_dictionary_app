import 'package:flutter/material.dart';
import 'package:free_dictionary/core/storage/storage.dart';
import 'package:free_dictionary/domain/usecases/load_current_language.dart';

class LocalLoadCurrentLanguage implements LoadCurrentLanguage {
  LocalLoadCurrentLanguage({required this.storage});

  final Storage storage;

  static const _key = 'current_language';

  @override
  Future<Locale?> call() async {
    final languageCode = await storage.getString(_key);
    if (languageCode == null) return null;

    final parts = languageCode.split('_');
    if (parts.length == 2) {
      return Locale(parts[0], parts[1]);
    }
    return Locale(parts[0]);
  }
}
