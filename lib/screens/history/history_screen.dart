import 'package:flutter/material.dart';
import 'package:free_dictionary/screens/history/history_store.dart';
import 'package:free_dictionary/widgets/widgets.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({
    super.key,
    required this.historyStore,
  });
  final HistoryStore historyStore;

  @override
  Widget build(BuildContext context) {
    return ScaffoldBase(
      builder: (context, l10n) => Center(
        child: Text(l10n.historyScreen),
      ),
    );
  }
}
