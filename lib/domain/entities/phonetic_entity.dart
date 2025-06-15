import 'package:equatable/equatable.dart';

class PhoneticEntity extends Equatable {
  const PhoneticEntity({
    this.text,
    this.audio,
  });

  final String? text;
  final String? audio;

  @override
  List<Object?> get props => [text, audio];
}
