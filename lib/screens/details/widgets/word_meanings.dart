import 'package:flutter/material.dart';

import 'package:free_dictionary/domain/domain.dart';
import 'package:free_dictionary/l10n/l10n.dart';

class WordMeanings extends StatelessWidget {
  const WordMeanings({
    super.key,
    required this.meanings,
  });

  final List<MeaningEntity> meanings;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: meanings.map((meaning) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                l10n.partOfSpeech.toUpperCase(),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ...meaning.definitions.map((definition) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      '• ${l10n.definition}: ${definition.definition}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    if (definition.example != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        '${l10n.exampleLabel} "${definition.example}"',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.secondary,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                    if (definition.synonyms.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Text(
                        '${l10n.synonymsLabel} ${definition.synonyms.join(", ")}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ],
                    if (definition.antonyms.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Text(
                        '${l10n.antonymsLabel} ${definition.antonyms.join(", ")}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ],
                  ],
                ),
              );
            }),
            const SizedBox(height: 16),
          ],
        );
      }).toList(),
    );
  }
} 