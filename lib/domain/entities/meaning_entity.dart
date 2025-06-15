import 'package:equatable/equatable.dart';

import 'definition_entity.dart';


class MeaningEntity extends Equatable {
  const MeaningEntity({
    required this.partOfSpeech,
    required this.definitions,
  });

  final String partOfSpeech;
  final List<DefinitionEntity> definitions;

  @override
  List<Object?> get props => [partOfSpeech, definitions];
}
