import 'package:free_dictionary/core/core.dart';
import 'package:free_dictionary/data/data.dart';
import 'package:free_dictionary/domain/domain.dart';

class RemoteLoadDictionary implements LoadDictionary {
  RemoteLoadDictionary({
    required this.client,
  });

  final HttpClient client;

  @override
  Future<WordEntity> call(String word) async {
    final response = await client.get(
      'https://api.dictionaryapi.dev/api/v2/entries/en/$word',
    );

    return WordModel.fromJson(response);
  }
}
