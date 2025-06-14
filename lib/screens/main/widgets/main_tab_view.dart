import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:free_dictionary/screens/favorites/favorites_screen.dart';
import 'package:free_dictionary/screens/favorites/favorites_store.dart';
import 'package:free_dictionary/screens/history/history_screen.dart';
import 'package:free_dictionary/screens/history/history_store.dart';
import 'package:free_dictionary/screens/home/home_screen.dart';

class MainTabView extends StatelessWidget {
  const MainTabView({
    super.key,
    required this.controller,
    required this.historyStore,
    required this.favoritesStore,
  });

  final TabController controller;
  final HistoryStore historyStore;
  final FavoritesStore favoritesStore;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => TabBarView(
        controller: controller,
        children: [
          HomeScreen(),
          HistoryScreen(historyStore: historyStore),
          FavoritesScreen(favoritesStore: favoritesStore),
        ],
      ),
    );
  }
}
