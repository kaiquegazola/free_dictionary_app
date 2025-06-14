import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Text(
              '$favoriteCount palavras favoritas',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          TextButton.icon(
            onPressed: onClear,
            icon: Icon(FontAwesomeIcons.trash),
            label: Text('Limpar'),
          ),
        ],
      ),
    );
  }
}
