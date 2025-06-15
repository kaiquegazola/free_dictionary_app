import 'package:flutter/material.dart';
import 'package:free_dictionary/screens/favorites/favorites.dart';
import 'package:free_dictionary/screens/history/history.dart';
import 'package:free_dictionary/screens/home/home.dart';

class MainTabView extends StatelessWidget {
  const MainTabView({
    super.key,
    required this.controller,
    required this.homeStore,
    required this.historyStore,
    required this.favoritesStore,
  });

  final HomeStore homeStore;
  final TabController controller;
  final HistoryStore historyStore;
  final FavoritesStore favoritesStore;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      clipBehavior: Clip.none,
      controller: controller,
      children: [
        HomeScreen(store: homeStore),
        HistoryScreen(store: historyStore),
        FavoritesScreen(store: favoritesStore),
      ],
    );
  }
}
