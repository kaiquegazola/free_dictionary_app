import 'package:equatable/equatable.dart';

class DefinitionEntity extends Equatable {
  const DefinitionEntity({
    required this.definition,
    this.example,
    required this.synonyms,
    required this.antonyms,
  });

  final String definition;
  final String? example;
  final List<String> synonyms;
  final List<String> antonyms;

  @override
  List<Object?> get props => [
        definition,
        example,
        synonyms,
        antonyms,
      ];
}
