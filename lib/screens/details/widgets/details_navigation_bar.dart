import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DetailsNavigationBar extends StatelessWidget {
  const DetailsNavigationBar({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onBack,
    required this.onNext,
    required this.onPrevious,
  });

  final int currentPage;
  final int totalPages;
  final VoidCallback onBack;
  final VoidCallback onNext;
  final VoidCallback onPrevious;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.fromLTRB(16, 0, 16, 8),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: currentPage > 0 ? onPrevious : null,
              child: const Text('Previous'),
            ),
          ),
          const Gap(8),
          Expanded(
            child: Text(
              '${currentPage + 1} of $totalPages',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ),
          const Gap(8),
          Expanded(
            child: FilledButton(
              onPressed: currentPage < totalPages - 1 ? onNext : null,
              child: const Text('Next'),
            ),
          ),
        ],
      ),
    );
  }
}
