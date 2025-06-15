import 'package:flutter/material.dart';

import 'home_store.dart';
import 'widgets/view_type_toggle.dart';
import 'widgets/words_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.store,
  });

  final HomeStore store;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    widget.store.loadWords();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ViewTypeToggle(store: widget.store),
                ],
              ),
            ),
            Expanded(
              child: WordsView(store: widget.store),
            ),
          ],
        ),
      ),
    );
  }
}
