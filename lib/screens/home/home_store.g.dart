// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStore, Store {
  late final _$wordsAtom = Atom(name: '_HomeStore.words', context: context);

  @override
  ObservableList<String> get words {
    _$wordsAtom.reportRead();
    return super.words;
  }

  @override
  set words(ObservableList<String> value) {
    _$wordsAtom.reportWrite(value, super.words, () {
      super.words = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_HomeStore.isLoading', context: context);

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

  late final _$errorAtom = Atom(name: '_HomeStore.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$isGridViewAtom =
      Atom(name: '_HomeStore.isGridView', context: context);

  @override
  bool get isGridView {
    _$isGridViewAtom.reportRead();
    return super.isGridView;
  }

  @override
  set isGridView(bool value) {
    _$isGridViewAtom.reportWrite(value, super.isGridView, () {
      super.isGridView = value;
    });
  }

  late final _$loadWordsAsyncAction =
      AsyncAction('_HomeStore.loadWords', context: context);

  @override
  Future<void> loadWords() {
    return _$loadWordsAsyncAction.run(() => super.loadWords());
  }

  late final _$_HomeStoreActionController =
      ActionController(name: '_HomeStore', context: context);

  @override
  void toggleViewType() {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.toggleViewType');
    try {
      return super.toggleViewType();
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
words: ${words},
isLoading: ${isLoading},
error: ${error},
isGridView: ${isGridView}
    ''';
  }
}
