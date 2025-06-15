// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DetailsStore on _DetailsStoreBase, Store {
  late final _$wordsAtom =
      Atom(name: '_DetailsStoreBase.words', context: context);

  @override
  List<WordEntity> get words {
    _$wordsAtom.reportRead();
    return super.words;
  }

  @override
  set words(List<WordEntity> value) {
    _$wordsAtom.reportWrite(value, super.words, () {
      super.words = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_DetailsStoreBase.isLoading', context: context);

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

  late final _$hasNoInternetAtom =
      Atom(name: '_DetailsStoreBase.hasNoInternet', context: context);

  @override
  bool get hasNoInternet {
    _$hasNoInternetAtom.reportRead();
    return super.hasNoInternet;
  }

  @override
  set hasNoInternet(bool value) {
    _$hasNoInternetAtom.reportWrite(value, super.hasNoInternet, () {
      super.hasNoInternet = value;
    });
  }

  late final _$hasServerErrorAtom =
      Atom(name: '_DetailsStoreBase.hasServerError', context: context);

  @override
  bool get hasServerError {
    _$hasServerErrorAtom.reportRead();
    return super.hasServerError;
  }

  @override
  set hasServerError(bool value) {
    _$hasServerErrorAtom.reportWrite(value, super.hasServerError, () {
      super.hasServerError = value;
    });
  }

  late final _$hasNotFoundAtom =
      Atom(name: '_DetailsStoreBase.hasNotFound', context: context);

  @override
  bool get hasNotFound {
    _$hasNotFoundAtom.reportRead();
    return super.hasNotFound;
  }

  @override
  set hasNotFound(bool value) {
    _$hasNotFoundAtom.reportWrite(value, super.hasNotFound, () {
      super.hasNotFound = value;
    });
  }

  late final _$isFavoriteAtom =
      Atom(name: '_DetailsStoreBase.isFavorite', context: context);

  @override
  bool get isFavorite {
    _$isFavoriteAtom.reportRead();
    return super.isFavorite;
  }

  @override
  set isFavorite(bool value) {
    _$isFavoriteAtom.reportWrite(value, super.isFavorite, () {
      super.isFavorite = value;
    });
  }

  late final _$loadWordAsyncAction =
      AsyncAction('_DetailsStoreBase.loadWord', context: context);

  @override
  Future<void> loadWord(String query) {
    return _$loadWordAsyncAction.run(() => super.loadWord(query));
  }

  late final _$toggleFavoriteAsyncAction =
      AsyncAction('_DetailsStoreBase.toggleFavorite', context: context);

  @override
  Future<void> toggleFavorite(String word) {
    return _$toggleFavoriteAsyncAction.run(() => super.toggleFavorite(word));
  }

  late final _$_DetailsStoreBaseActionController =
      ActionController(name: '_DetailsStoreBase', context: context);

  @override
  void _resetStates() {
    final _$actionInfo = _$_DetailsStoreBaseActionController.startAction(
        name: '_DetailsStoreBase._resetStates');
    try {
      return super._resetStates();
    } finally {
      _$_DetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
words: ${words},
isLoading: ${isLoading},
hasNoInternet: ${hasNoInternet},
hasServerError: ${hasServerError},
hasNotFound: ${hasNotFound},
isFavorite: ${isFavorite}
    ''';
  }
}
