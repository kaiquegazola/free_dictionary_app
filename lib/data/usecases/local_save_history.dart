import 'package:free_dictionary/core/storage/storage.dart';
import 'package:free_dictionary/domain/usecases/save_history.dart';

class LocalSaveHistory implements SaveHistory {
  LocalSaveHistory({required this.storage});
  final Storage storage;
  static const _key = 'history';
  static const _maxHistoryItems = 100;

  @override
  Future<void> call(String word) async {
    final history = await storage.getStringList(_key) ?? [];

    // Remove if exists to add to the beginning
    history.remove(word);
    history.insert(0, word);

    // Keep only the last N items
    if (history.length > _maxHistoryItems) {
      history.removeRange(_maxHistoryItems, history.length);
    }

    await storage.setStringList(_key, history);
  }
}
