import 'package:free_dictionary/core/core.dart';
import 'package:free_dictionary/data/data.dart';
import 'package:free_dictionary/domain/domain.dart';

class RemoteLoadDictionary implements LoadDictionary {
  RemoteLoadDictionary({
    required this.client,
  });

  final HttpClient client;

  @override
  Future<List<WordEntity>> call(String word) async {
    final response = await client.get<List>(
      'https://api.dictionaryapi.dev/api/v2/entries/en/$word',
    );

    return List<WordEntity>.from(
      response.data.map((json) => WordModel.fromJson(json)),
    );
  }
}
