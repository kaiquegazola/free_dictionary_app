import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:free_dictionary/l10n/l10n.dart';

import '../home_store.dart';
import 'error_view.dart';
import 'word_grid_view.dart';
import 'word_list_view.dart';

class WordsView extends StatelessWidget {
  const WordsView({
    super.key,
    required this.store,
    required this.onWordTap,
  });

  final HomeStore store;
  final void Function(String word) onWordTap;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (store.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (store.error != null) {
          return ErrorView(
            error: store.error!,
            onRetry: store.loadWords,
          );
        }

        if (store.words.isEmpty) {
          return Center(
            child: Text(l10n.noWordsFound),
          );
        }

        if (store.isGridView) {
          return WordGridView(
            words: store.words.toList(),
            onWordTap: onWordTap,
          );
        }

        return WordListView(
          words: store.words.toList(),
          onWordTap: onWordTap,
        );
      },
    );
  }
}
