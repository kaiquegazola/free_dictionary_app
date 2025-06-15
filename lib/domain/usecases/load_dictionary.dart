import 'package:free_dictionary/domain/domain.dart';

abstract class LoadDictionary {
  Future<List<WordEntity>> call(String word);
}
