import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:free_dictionary/domain/domain.dart';

class WordPhonetics extends StatelessWidget {
  const WordPhonetics({
    super.key,
    this.phonetic,
    required this.phonetics,
    required this.onPlayAudio,
  });

  final String? phonetic;
  final List<PhoneticEntity> phonetics;
  final void Function(String?) onPlayAudio;

  @override
  Widget build(BuildContext context) {
    if (phonetic == null && phonetics.isEmpty) {
      return const SizedBox.shrink();
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (phonetic != null)
          Text(
            phonetic!,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        if (phonetics.any((p) => p.audio?.isNotEmpty == true)) ...[
          const SizedBox(width: 8),
          IconButton(
            onPressed: () {
              final audioUrl = phonetics
                  .firstWhereOrNull(
                    (p) => p.audio?.isNotEmpty == true,
                  )
                  ?.audio;
              onPlayAudio(audioUrl);
            },
            icon: const Icon(Icons.volume_up),
          ),
        ],
      ],
    );
  }
}
