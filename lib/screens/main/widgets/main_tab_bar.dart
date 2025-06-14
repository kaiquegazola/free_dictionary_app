import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    return Center(
      child: TabBar(
        indicatorWeight: 2,
        indicatorSize: TabBarIndicatorSize.tab,
        controller: controller,
        labelStyle: Theme.of(context).textTheme.bodyMedium,
        isScrollable: true,
        padding: EdgeInsets.zero,
        tabAlignment: TabAlignment.center,
        labelPadding: const EdgeInsets.symmetric(horizontal: 16),
        tabs: [
          for (final tab in TabOption.values)
            Tab(
              icon: Icon(_getIconForTab(tab)),
              text: _getLabelForTab(tab),
            ),
        ],
      ),
    );
  }

  IconData _getIconForTab(TabOption tab) {
    switch (tab) {
      case TabOption.wordList:
        return FontAwesomeIcons.book;
      case TabOption.history:
        return FontAwesomeIcons.clockRotateLeft;
      case TabOption.favorites:
        return FontAwesomeIcons.heart;
    }
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
