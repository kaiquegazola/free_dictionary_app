import 'package:flutter/material.dart';

import 'l10n.dart';

class L10nInitializer extends StatelessWidget {
  const L10nInitializer({
    super.key,
    required this.builder,
  });

  final Widget Function(BuildContext context, Locale locale) builder;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: currentLocale,
      builder: (context, locale, _) => builder(context, locale),
    );
  }
}
