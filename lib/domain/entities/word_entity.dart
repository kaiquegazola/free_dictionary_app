import 'package:equatable/equatable.dart';

import 'meaning_entity.dart';
import 'phonetic_entity.dart';

class WordEntity extends Equatable {
  const WordEntity({
    required this.word,
    this.phonetic,
    required this.phonetics,
    this.origin,
    required this.meanings,
  });

  final String word;
  final String? phonetic;
  final List<PhoneticEntity> phonetics;
  final String? origin;
  final List<MeaningEntity> meanings;

  @override
  List<Object?> get props => [
        word,
        phonetic,
        phonetics,
        origin,
        meanings,
      ];
}
