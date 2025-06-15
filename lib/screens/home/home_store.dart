import 'package:free_dictionary/domain/domain.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  _HomeStore({
    required this.localLoadWords,
  });

  final LoadWords localLoadWords;

  @observable
  ObservableList<String> words = ObservableList<String>();

  @observable
  bool isLoading = false;

  @observable
  String? error;

  @observable
  bool isGridView = true;

  @action
  void toggleViewType() {
    isGridView = !isGridView;
  }

  @action
  Future<void> loadWords() async {
    try {
      isLoading = true;
      error = null;
      final result = await localLoadWords.call();
      words.clear();
      words.addAll(result);
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
    }
  }
}
