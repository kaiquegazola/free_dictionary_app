import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:free_dictionary/widgets/widgets.dart';

import 'favorites_store.dart';
import 'widgets/widgets.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({
    super.key,
    required this.favoritesStore,
  });
  final FavoritesStore favoritesStore;

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  FavoritesStore get _favoritesStore => widget.favoritesStore;

  @override
  void initState() {
    super.initState();
    _favoritesStore.loadFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldBase(
      builder: (context, l10n) => Observer(
        builder: (context) {
          if (_favoritesStore.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (_favoritesStore.favoriteWords.isEmpty) {
            return const EmptyFavorites();
          }

          return ListView.builder(
            itemCount: _favoritesStore.favoriteWords.length,
            itemBuilder: (context, index) {
              final favorite = _favoritesStore.favoriteWords[index];
              return ListTile(
                title: Text(favorite.word),
                subtitle: favorite.phonetic != null
                    ? Text(favorite.phonetic!)
                    : null,
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () =>
                      _favoritesStore.removeFromFavorites(favorite.word),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
