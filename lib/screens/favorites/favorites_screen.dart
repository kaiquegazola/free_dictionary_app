import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:free_dictionary/l10n/l10n.dart';
import 'package:free_dictionary/widgets/scaffold_base.dart';
import 'package:go_router/go_router.dart';

import 'favorites_store.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({
    super.key,
    required this.store,
  });

  final FavoritesStore store;

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    super.initState();
    widget.store.loadFavoriteWords();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldBase(
      builder: (BuildContext context, AppLocalizations l10n) {
        return Observer(
          builder: (context) {
            if (widget.store.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (widget.store.favorites.isEmpty) {
              return Center(
                child: Text(l10n.noFavorites),
              );
            }

            return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: widget.store.favorites.length,
              itemBuilder: (context, index) {
                final word = widget.store.favorites[index];
                return ListTile(
                  title: Text(word),
                  trailing: IconButton(
                    icon: const Icon(Icons.favorite),
                    onPressed: () => widget.store.toggleFavorite(word),
                  ),
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
