import 'package:flutter/material.dart';
import 'package:free_dictionary/l10n/app_localizations.dart';
import 'package:free_dictionary/l10n/l10n.dart';

class L10nInitializer extends StatelessWidget {
  const L10nInitializer({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final localizations = AppLocalizations.of(context);
        if (localizations != null) {
          setL10n(localizations);
        }
        return child;
      },
    );
  }
}
