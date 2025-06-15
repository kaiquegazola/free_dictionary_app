import 'package:flutter/material.dart';

class WordListView extends StatelessWidget {
  final List<String> words;

  const WordListView({
    super.key,
    required this.words,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: words.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(words[index]),
        );
      },
    );
  }
} 