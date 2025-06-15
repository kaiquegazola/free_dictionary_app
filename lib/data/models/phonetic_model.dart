import 'package:free_dictionary/domain/domain.dart';

class PhoneticModel extends PhoneticEntity {
  const PhoneticModel({
    super.text,
    super.audio,
  });

  factory PhoneticModel.fromJson(Map<String, dynamic> json) {
    return PhoneticModel(
      text: json['text'] as String?,
      audio: json['audio'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'audio': audio,
    };
  }
}
