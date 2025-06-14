import 'package:mobx/mobx.dart';

part 'favorites_store.g.dart';

class FavoritesStore = _FavoritesStore with _$FavoritesStore;

class FavoriteWord {
  FavoriteWord({required this.word, this.phonetic});
  final String word;
  final String? phonetic;
}

abstract class _FavoritesStore with Store {
  @observable
  bool isLoading = false;

  @observable
  ObservableList<FavoriteWord> favoriteWords = ObservableList<FavoriteWord>();

  @computed
  bool Function(String word) get isFavorite =>
      (word) => favoriteWords.any((favorite) => favorite.word == word);

  @action
  Future<void> loadFavorites() async {
    isLoading = true;
    try {
      // TODO: Implement loading from storage
      await Future.delayed(const Duration(seconds: 1));
      favoriteWords.clear();
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> removeFromFavorites(String word) async {
    favoriteWords.removeWhere((favorite) => favorite.word == word);
    // TODO: Implement saving to storage
  }

  @action
  Future<void> clearFavorites() async {
    favoriteWords.clear();
    // TODO: Implement saving to storage
  }

  @action
  Future<void> addToFavorites(String word, {String? phonetic}) async {
    if (!favoriteWords.any((favorite) => favorite.word == word)) {
      favoriteWords.add(FavoriteWord(word: word, phonetic: phonetic));
      // TODO: Implement saving to storage
    }
  }
}
