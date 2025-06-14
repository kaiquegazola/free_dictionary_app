import 'package:mobx/mobx.dart';

part 'history_store.g.dart';

class HistoryStore = _HistoryStore with _$HistoryStore;

abstract class _HistoryStore with Store {
  @observable
  ObservableList<String> searchHistory = ObservableList<String>();

  @action
  void addToHistory(String word) {
    if (searchHistory.contains(word)) {
      searchHistory.remove(word);
    }
    searchHistory.insert(0, word);
  }

  @action
  void removeFromHistory(String word) {
    searchHistory.remove(word);
  }

  @action
  void clearHistory() {
    searchHistory.clear();
  }
}
