import 'package:free_dictionary/domain/domain.dart';
import 'models.dart';

class MeaningModel extends MeaningEntity {
  const MeaningModel({
    required super.partOfSpeech,
    required super.definitions,
  });

  factory MeaningModel.fromJson(Map<String, dynamic> json) {
    return MeaningModel(
      partOfSpeech: json['partOfSpeech'] as String,
      definitions: (json['definitions'] as List<dynamic>)
          .map((e) => DefinitionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'partOfSpeech': partOfSpeech,
      'definitions':
          definitions.map((e) => (e as DefinitionModel).toJson()).toList(),
    };
  }
} 