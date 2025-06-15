import 'package:free_dictionary/core/storage/storage.dart';
import 'package:free_dictionary/domain/usecases/is_favorited.dart';

class LocalIsFavorited implements IsFavorited {
  LocalIsFavorited({required this.storage});
  final Storage storage;
  static const _key = 'favorites';

  @override
  Future<bool> call(String word) async {
    final favorites = await storage.getStringList(_key) ?? [];
    return favorites.contains(word);
  }
}
