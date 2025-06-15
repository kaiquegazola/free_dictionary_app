import 'package:free_dictionary/domain/domain.dart';
import 'package:mobx/mobx.dart';

part 'favorites_store.g.dart';

class FavoritesStore = _FavoritesStoreBase with _$FavoritesStore;

abstract class _FavoritesStoreBase with Store {
  _FavoritesStoreBase({
    required this.loadFavorites,
    required this.saveFavorite,
    required this.isFavorited,
  });

  final LoadFavorites loadFavorites;
  final SaveFavorite saveFavorite;
  final IsFavorited isFavorited;

  @observable
  ObservableList<String> favorites = ObservableList<String>();

  @observable
  bool isLoading = false;

  @action
  Future<void> loadFavoriteWords() async {
    isLoading = true;
    try {
      final result = await loadFavorites.call();
      favorites = ObservableList.of(result);
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> toggleFavorite(String word) async {
    final isFavorite = await isFavorited.call(word);
    if (isFavorite) {
      favorites.remove(word);
    } else {
      favorites.add(word);
    }
    await saveFavorite.call(word);
  }
}
