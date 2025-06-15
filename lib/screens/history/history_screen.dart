import 'package:flutter/material.dart';
import 'package:free_dictionary/l10n/l10n.dart';
import 'package:free_dictionary/screens/history/history_store.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({
    super.key,
    required this.historyStore,
  });
  final HistoryStore historyStore;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(l10n.historyScreen),
    );
  }
}
