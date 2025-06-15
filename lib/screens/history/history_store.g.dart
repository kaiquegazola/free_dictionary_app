// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HistoryStore on _HistoryStoreBase, Store {
  late final _$historyAtom =
      Atom(name: '_HistoryStoreBase.history', context: context);

  @override
  ObservableList<String> get history {
    _$historyAtom.reportRead();
    return super.history;
  }

  @override
  set history(ObservableList<String> value) {
    _$historyAtom.reportWrite(value, super.history, () {
      super.history = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_HistoryStoreBase.isLoading', context: context);

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

  late final _$loadHistoryWordsAsyncAction =
      AsyncAction('_HistoryStoreBase.loadHistoryWords', context: context);

  @override
  Future<void> loadHistoryWords() {
    return _$loadHistoryWordsAsyncAction.run(() => super.loadHistoryWords());
  }

  @override
  String toString() {
    return '''
history: ${history},
isLoading: ${isLoading}
    ''';
  }
}
