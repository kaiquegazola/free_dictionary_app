import 'package:free_dictionary/domain/domain.dart';

abstract class LoadDictionary {
  Future<WordEntity> call(String word);
}
