// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HistoryStore on _HistoryStore, Store {
  late final _$searchHistoryAtom =
      Atom(name: '_HistoryStore.searchHistory', context: context);

  @override
  ObservableList<String> get searchHistory {
    _$searchHistoryAtom.reportRead();
    return super.searchHistory;
  }

  @override
  set searchHistory(ObservableList<String> value) {
    _$searchHistoryAtom.reportWrite(value, super.searchHistory, () {
      super.searchHistory = value;
    });
  }

  late final _$_HistoryStoreActionController =
      ActionController(name: '_HistoryStore', context: context);

  @override
  void addToHistory(String word) {
    final _$actionInfo = _$_HistoryStoreActionController.startAction(
        name: '_HistoryStore.addToHistory');
    try {
      return super.addToHistory(word);
    } finally {
      _$_HistoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeFromHistory(String word) {
    final _$actionInfo = _$_HistoryStoreActionController.startAction(
        name: '_HistoryStore.removeFromHistory');
    try {
      return super.removeFromHistory(word);
    } finally {
      _$_HistoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearHistory() {
    final _$actionInfo = _$_HistoryStoreActionController.startAction(
        name: '_HistoryStore.clearHistory');
    try {
      return super.clearHistory();
    } finally {
      _$_HistoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchHistory: ${searchHistory}
    ''';
  }
}
