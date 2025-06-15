import 'package:flutter/material.dart';
import 'package:free_dictionary/l10n/l10n.dart';

class DetailsNavigationBar extends StatelessWidget {
  const DetailsNavigationBar({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPrevious,
    required this.onNext,
  });

  final int currentPage;
  final int totalPages;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            onPressed: currentPage > 0 ? onPrevious : null,
            icon: const Icon(Icons.arrow_back),
            label: Text(l10n.previous),
          ),
          Text('${currentPage + 1} / $totalPages'),
          TextButton.icon(
            onPressed: currentPage < totalPages - 1 ? onNext : null,
            icon: const Icon(Icons.arrow_forward),
            label: Text(l10n.next),
          ),
        ],
      ),
    );
  }
}
