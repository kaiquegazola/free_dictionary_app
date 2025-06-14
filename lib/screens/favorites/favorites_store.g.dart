// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavoritesStore on _FavoritesStore, Store {
  Computed<bool Function(String)>? _$isFavoriteComputed;

  @override
  bool Function(String) get isFavorite => (_$isFavoriteComputed ??=
          Computed<bool Function(String)>(() => super.isFavorite,
              name: '_FavoritesStore.isFavorite'))
      .value;

  late final _$isLoadingAtom =
      Atom(name: '_FavoritesStore.isLoading', context: context);

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

  late final _$favoriteWordsAtom =
      Atom(name: '_FavoritesStore.favoriteWords', context: context);

  @override
  ObservableList<FavoriteWord> get favoriteWords {
    _$favoriteWordsAtom.reportRead();
    return super.favoriteWords;
  }

  @override
  set favoriteWords(ObservableList<FavoriteWord> value) {
    _$favoriteWordsAtom.reportWrite(value, super.favoriteWords, () {
      super.favoriteWords = value;
    });
  }

  late final _$loadFavoritesAsyncAction =
      AsyncAction('_FavoritesStore.loadFavorites', context: context);

  @override
  Future<void> loadFavorites() {
    return _$loadFavoritesAsyncAction.run(() => super.loadFavorites());
  }

  late final _$removeFromFavoritesAsyncAction =
      AsyncAction('_FavoritesStore.removeFromFavorites', context: context);

  @override
  Future<void> removeFromFavorites(String word) {
    return _$removeFromFavoritesAsyncAction
        .run(() => super.removeFromFavorites(word));
  }

  late final _$clearFavoritesAsyncAction =
      AsyncAction('_FavoritesStore.clearFavorites', context: context);

  @override
  Future<void> clearFavorites() {
    return _$clearFavoritesAsyncAction.run(() => super.clearFavorites());
  }

  late final _$addToFavoritesAsyncAction =
      AsyncAction('_FavoritesStore.addToFavorites', context: context);

  @override
  Future<void> addToFavorites(String word, {String? phonetic}) {
    return _$addToFavoritesAsyncAction
        .run(() => super.addToFavorites(word, phonetic: phonetic));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
favoriteWords: ${favoriteWords},
isFavorite: ${isFavorite}
    ''';
  }
}
