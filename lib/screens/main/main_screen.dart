import 'package:flutter/material.dart';
import 'package:free_dictionary/l10n/l10n.dart';
import 'package:free_dictionary/screens/screens.dart';

import 'tab_options.dart';
import 'widgets/language_selector.dart';
import 'widgets/main_tab_bar.dart';
import 'widgets/main_tab_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
    required this.mainStore,
    required this.homeStore,
    required this.historyStore,
    required this.favoritesStore,
  });

  final MainStore mainStore;
  final HomeStore homeStore;
  final HistoryStore historyStore;
  final FavoritesStore favoritesStore;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: TabOption.values.length,
      vsync: this,
      initialIndex: widget.mainStore.currentIndex,
    );
    _tabController.addListener(_handleTabChange);
  }

  void _handleTabChange() {
    if (!_tabController.indexIsChanging) {
      widget.mainStore.setCurrentIndex(_tabController.index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appTitle),
        centerTitle: true,
        actions: [
          LanguageSelector(store: widget.mainStore),
        ],
        bottom: MainTabBar(controller: _tabController),
      ),
      body: MainTabView(
        controller: _tabController,
        homeStore: widget.homeStore,
        historyStore: widget.historyStore,
        favoritesStore: widget.favoritesStore,
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
