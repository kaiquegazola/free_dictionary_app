import 'package:flutter/material.dart';
import 'package:free_dictionary/screens/history/history_store.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({
    super.key,
    required this.historyStore,
  });
  final HistoryStore historyStore;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('History Screen'),
    );
  }
}
