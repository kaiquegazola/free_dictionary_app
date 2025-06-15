import 'package:free_dictionary/core/storage/storage.dart';
import 'package:free_dictionary/domain/usecases/remove_favorite.dart';

class LocalRemoveFavorite implements RemoveFavorite {
  LocalRemoveFavorite({required this.storage});

  final Storage storage;

  static const _key = 'favorites';

  @override
  Future<void> call(String word) async {
    final favorites = await storage.getStringList(_key) ?? [];
    if (favorites.contains(word)) {
      favorites.remove(word);
      await storage.setStringList(_key, favorites);
    }
  }
}
