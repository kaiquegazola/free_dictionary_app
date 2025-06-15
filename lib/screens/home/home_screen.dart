import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    widget.store.loadWords();
  }

  void _onWordTap(String word) {
    context.push('/details/$word');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ViewTypeToggle(store: widget.store),
              ],
            ),
            Expanded(
              child: WordsView(
                store: widget.store,
                onWordTap: _onWordTap,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
