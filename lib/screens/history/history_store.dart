import 'package:free_dictionary/domain/domain.dart';
import 'package:mobx/mobx.dart';

part 'history_store.g.dart';

class HistoryStore = _HistoryStoreBase with _$HistoryStore;

abstract class _HistoryStoreBase with Store {
  _HistoryStoreBase({
    required this.loadHistory,
  });

  final LoadHistory loadHistory;

  @observable
  ObservableList<String> history = ObservableList<String>();

  @observable
  bool isLoading = false;

  @action
  Future<void> loadHistoryWords() async {
    isLoading = true;
    try {
      final result = await loadHistory.call();
      history = ObservableList.of(result);
    } finally {
      isLoading = false;
    }
  }
}
