import 'package:free_dictionary/domain/domain.dart';

class DefinitionModel extends DefinitionEntity {
  const DefinitionModel({
    required super.definition,
    super.example,
    required super.synonyms,
    required super.antonyms,
  });

  factory DefinitionModel.fromJson(Map<String, dynamic> json) {
    return DefinitionModel(
      definition: json['definition'] as String,
      example: json['example'] as String?,
      synonyms: (json['synonyms'] as List<dynamic>).cast<String>(),
      antonyms: (json['antonyms'] as List<dynamic>).cast<String>(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'definition': definition,
      'example': example,
      'synonyms': synonyms,
      'antonyms': antonyms,
    };
  }
}
