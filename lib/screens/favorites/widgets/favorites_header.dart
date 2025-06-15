import 'package:flutter/material.dart';
import 'package:free_dictionary/l10n/l10n.dart';

class FavoritesHeader extends StatelessWidget {
  const FavoritesHeader({
    super.key,
    required this.favoriteCount,
    required this.onClear,
  });
  final int favoriteCount;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Text(
            l10n.favoriteWordsCount(favoriteCount),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
          FilledButton.icon(
            onPressed: onClear,
            label: Text(l10n.clear),
            icon: const Icon(Icons.delete_outline),
          ),
        ],
      ),
    );
  }
}
