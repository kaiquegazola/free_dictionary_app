import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:free_dictionary/l10n/l10n.dart';
import 'package:free_dictionary/screens/main/main_store.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({
    super.key,
    required this.store,
  });
  final MainStore store;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Locale>(
      icon: Icon(FontAwesomeIcons.language),
      onSelected: (locale) => store.changeLocale(locale),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: const Locale('pt', 'BR'),
          child: Row(
            children: [
              Text(l10n.brazilFlag),
              const SizedBox(width: 8),
              Text(l10n.portuguese),
              if (store.currentLocale.languageCode == 'pt') const Spacer(),
              if (store.currentLocale.languageCode == 'pt')
                Icon(FontAwesomeIcons.check, size: 16),
            ],
          ),
        ),
        PopupMenuItem(
          value: const Locale('en', 'US'),
          child: Row(
            children: [
              Text(l10n.usaFlag),
              const SizedBox(width: 8),
              Text(l10n.english),
              if (store.currentLocale.languageCode == 'en') const Spacer(),
              if (store.currentLocale.languageCode == 'en')
                Icon(FontAwesomeIcons.check, size: 16),
            ],
          ),
        ),
      ],
    );
  }
}
