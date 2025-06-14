import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:free_dictionary/l10n/app_localizations.dart';

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
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: Observer(
        builder: (context) {
          if (_favoritesStore.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (_favoritesStore.favoriteWords.isEmpty) {
            return const EmptyFavorites();
          }

          return Column(
            children: [
              FavoritesHeader(
                favoriteCount: _favoritesStore.favoriteWords.length,
                onClear: () => _showClearFavoritesDialog(context, l10n),
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: _getCrossAxisCount(context),
                    childAspectRatio: 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: _favoritesStore.favoriteWords.length,
                  itemBuilder: (context, index) {
                    final word = _favoritesStore.favoriteWords[index];
                    return FavoriteCard(
                      word: word.word,
                      phonetic: word.phonetic,
                      onRemove: () =>
                          _favoritesStore.removeFromFavorites(word.word),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _showClearFavoritesDialog(BuildContext context, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Limpar favoritos'),
        content: const Text(
          'Tem certeza que deseja remover todas as palavras dos favoritos?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () {
              _favoritesStore.clearFavorites();
              Navigator.of(context).pop();
            },
            child: const Text('Limpar'),
          ),
        ],
      ),
    );
  }

  int _getCrossAxisCount(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width > 1200) return 3;
    if (width > 800) return 2;
    return 1;
  }
}
