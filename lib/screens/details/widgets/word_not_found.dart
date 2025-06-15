import 'package:flutter/material.dart';

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
      title: 'Word not found',
      message: 'We couldn\'t find any definitions for "$word"',
      buttonLabel: 'Go Back',
      onButtonPressed: onBack,
    );
  }
} 