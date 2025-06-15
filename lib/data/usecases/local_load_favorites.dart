import 'package:free_dictionary/core/storage/storage.dart';
import 'package:free_dictionary/domain/usecases/load_favorites.dart';

class LocalLoadFavorites implements LoadFavorites {
  LocalLoadFavorites({required this.storage});
  final Storage storage;
  static const _key = 'favorites';

  @override
  Future<List<String>> call() async {
    final favorites = await storage.getStringList(_key);
    return favorites ?? [];
  }
}
