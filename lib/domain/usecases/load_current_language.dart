import 'package:flutter/material.dart';

abstract class LoadCurrentLanguage {
  Future<Locale?> call();
}
