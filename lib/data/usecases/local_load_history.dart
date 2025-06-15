import 'package:free_dictionary/core/storage/storage.dart';
import 'package:free_dictionary/domain/usecases/load_history.dart';

class LocalLoadHistory implements LoadHistory {
  LocalLoadHistory({required this.storage});
  final Storage storage;
  static const _key = 'history';

  @override
  Future<List<String>> call() async {
    final history = await storage.getStringList(_key);
    return history ?? [];
  }
}
