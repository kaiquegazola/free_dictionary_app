import 'package:flutter/material.dart';

class WordListView extends StatelessWidget {
  const WordListView({
    super.key,
    required this.words,
    required this.onWordTap,
  });

  final List<String> words;
  final void Function(String word) onWordTap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: words.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (context, index) {
        final word = words[index];
        return ListTile(
          title: Text(word),
          onTap: () => onWordTap(word),
        );
      },
    );
  }
}
