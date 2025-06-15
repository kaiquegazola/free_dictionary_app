import 'package:mobx/mobx.dart';

import '../../core/core.dart';
import '../../domain/domain.dart';

part 'details_store.g.dart';

class DetailsStore = _DetailsStoreBase with _$DetailsStore;

abstract class _DetailsStoreBase with Store {
  final LoadDictionary loadDictionary;

  _DetailsStoreBase({required this.loadDictionary});

  @observable
  List<WordEntity> words = [];

  @observable
  bool isLoading = false;

  @observable
  bool hasNoInternet = false;

  @observable
  bool hasServerError = false;

  @observable
  bool hasNotFound = false;

  @action
  void _resetStates() {
    hasNoInternet = false;
    hasServerError = false;
    hasNotFound = false;
    isLoading = false;
  }

  @action
  Future<void> loadWord(String query) async {
    _resetStates();
    isLoading = true;

    try {
      final result = await loadDictionary.call(query);
      words = result;
    } on GenericException catch (error) {
      if (error is NoInternetError) {
        hasNoInternet = true;
      } else if (error is ServerError) {
        hasServerError = true;
      } else if (error is NotFound) {
        hasNotFound = true;
      }
    } finally {
      isLoading = false;
    }
  }
}
