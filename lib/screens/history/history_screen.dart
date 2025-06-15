import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:free_dictionary/screens/history/history_store.dart';
import 'package:free_dictionary/widgets/scaffold_base.dart';
import 'package:go_router/go_router.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({
    super.key,
    required this.store,
  });

  final HistoryStore store;

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    super.initState();
    widget.store.loadHistoryWords();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldBase(
      builder: (context, l10n) {
        return Observer(
          builder: (context) {
            if (widget.store.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (widget.store.history.isEmpty) {
              return Center(
                child: Text(l10n.noHistory),
              );
            }

            return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: widget.store.history.length,
              itemBuilder: (context, index) {
                final word = widget.store.history[index];
                return ListTile(
                  title: Text(word),
                  onTap: () {
                    context.push('/details/$word');
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
