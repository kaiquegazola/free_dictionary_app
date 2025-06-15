import 'package:flutter/material.dart';

abstract class SaveCurrentLanguage {
  Future<void> call(Locale locale);
}
