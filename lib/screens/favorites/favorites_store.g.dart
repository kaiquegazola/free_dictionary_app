// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavoritesStore on _FavoritesStoreBase, Store {
  late final _$favoritesAtom =
      Atom(name: '_FavoritesStoreBase.favorites', context: context);

  @override
  ObservableList<String> get favorites {
    _$favoritesAtom.reportRead();
    return super.favorites;
  }

  @override
  set favorites(ObservableList<String> value) {
    _$favoritesAtom.reportWrite(value, super.favorites, () {
      super.favorites = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_FavoritesStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$loadFavoriteWordsAsyncAction =
      AsyncAction('_FavoritesStoreBase.loadFavoriteWords', context: context);

  @override
  Future<void> loadFavoriteWords() {
    return _$loadFavoriteWordsAsyncAction.run(() => super.loadFavoriteWords());
  }

  late final _$toggleFavoriteAsyncAction =
      AsyncAction('_FavoritesStoreBase.toggleFavorite', context: context);

  @override
  Future<void> toggleFavorite(String word) {
    return _$toggleFavoriteAsyncAction.run(() => super.toggleFavorite(word));
  }

  @override
  String toString() {
    return '''
favorites: ${favorites},
isLoading: ${isLoading}
    ''';
  }
}
