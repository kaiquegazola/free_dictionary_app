import 'package:flutter/material.dart';
import 'package:free_dictionary/l10n/l10n.dart';
import 'package:free_dictionary/widgets/widgets.dart';

class WordNotFound extends StatelessWidget {
  const WordNotFound({
    super.key,
    required this.word,
    required this.onBack,
  });

  final String word;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return ErrorState(
      icon: Icons.search_off_rounded,
      title: l10n.wordNotFoundTitle,
      message: l10n.wordNotFoundMessage(word),
      buttonLabel: l10n.goBack,
      onButtonPressed: onBack,
    );
  }
} 