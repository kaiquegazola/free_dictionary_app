import 'package:flutter/material.dart';
import 'package:free_dictionary/l10n/l10n.dart';

import '../tab_options.dart';

class MainTabBar extends StatelessWidget implements PreferredSizeWidget {
  const MainTabBar({
    super.key,
    required this.controller,
  });
  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      tabs: [
        for (final tab in TabOption.values)
          Tab(
            text: _getLabelForTab(tab),
          ),
      ],
    );
  }

  String _getLabelForTab(TabOption tab) {
    switch (tab) {
      case TabOption.wordList:
        return l10n.wordList;
      case TabOption.history:
        return l10n.history;
      case TabOption.favorites:
        return l10n.favorites;
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
