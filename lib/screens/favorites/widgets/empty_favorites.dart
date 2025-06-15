import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:free_dictionary/l10n/l10n.dart';
import 'package:gap/gap.dart';

class EmptyFavorites extends StatelessWidget {
  const EmptyFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            FontAwesomeIcons.heart,
            size: 48,
            color: theme.colorScheme.primary,
          ),
          const Gap(16),
          Text(
            l10n.noFavoriteWords,
            style: theme.textTheme.titleLarge,
          ),
          const Gap(8),
          Text(
            l10n.addFavoritesToSeeHere,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
