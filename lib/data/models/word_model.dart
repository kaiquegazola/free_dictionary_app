import 'package:free_dictionary/domain/domain.dart';
import 'models.dart';

class WordModel extends WordEntity {
  const WordModel({
    required super.word,
    super.phonetic,
    required super.phonetics,
    super.origin,
    required super.meanings,
  });

  factory WordModel.fromJson(Map<String, dynamic> json) {
    return WordModel(
      word: json['word'] as String,
      phonetic: json['phonetic'] as String?,
      phonetics: (json['phonetics'] as List<dynamic>)
          .map((e) => PhoneticModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      origin: json['origin'] as String?,
      meanings: (json['meanings'] as List<dynamic>)
          .map((e) => MeaningModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'word': word,
      'phonetic': phonetic,
      'phonetics': phonetics.map((e) => (e as PhoneticModel).toJson()).toList(),
      'origin': origin,
      'meanings': meanings.map((e) => (e as MeaningModel).toJson()).toList(),
    };
  }
}
