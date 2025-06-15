import 'package:flutter/material.dart';

class WordGridView extends StatelessWidget {
  const WordGridView({
    super.key,
    required this.words,
    required this.onWordTap,
  });

  final List<String> words;
  final void Function(String word) onWordTap;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1,
      ),
      itemCount: words.length,
      itemBuilder: (context, index) {
        final word = words[index];
        return Card(
          child: InkWell(
            onTap: () => onWordTap(word),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  word,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
